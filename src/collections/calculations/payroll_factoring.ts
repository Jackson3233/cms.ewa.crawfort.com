// ===========================
// 🏭 PAYROLL FACTORING
// ===========================
// Purpose: Calculate advance amounts, fees, and due dates
// Business Rules:
// - No minimum amount (flat fee PHP38 if below PHP100)
// - Maximum 90% of salary for advances
// - Membership tiers affect processing fees:
//   • Bronze: 5%
//   • Silver: 4.5%
//   • Gold: 4%
//   • Platinum: 3%
// - Default tenure: 2 weeks (14 days)
// - Interest only after first repayment
// Author: Your Name
// Last Updated: 2024
// ===========================

import { CollectionConfig } from 'payload'
import { calculationAccess } from '../../access/accessControl'
import { MembershipTier, TIER_PROCESSING_FEES } from '@/utilities/validators/payroll_financial'
import { v4 as uuidv4 } from 'uuid'

export interface FactoringParams {
  employeeSalary: number
  requestedAmount: number
  membershipTier: MembershipTier
  termDays: number
  isFirstAdvance: boolean
  companyUUID: string
  employeeId: string
}

export interface FactoringResult {
  advanceAmount: number
  processingFee: number
  totalAmount: number
  dueDate: Date
  effectiveRate: number
  breakdown: {
    maxAllowedAmount: number
    processingFeeRate: number
    flatFeeApplied: boolean
    paymentSchedule: PaymentSchedule
  }
}

interface PaymentSchedule {
  dueDate: Date
  amount: number
  processingFee: number
  totalDue: number
}

// Constants
const MINIMUM_FEE_THRESHOLD = 100 // PHP
const FLAT_FEE = 38 // PHP
const MAX_ADVANCE_PERCENTAGE = 90
const DEFAULT_TERM_DAYS = 14

export const calculateFactoring = ({
  employeeSalary,
  requestedAmount,
  membershipTier = MembershipTier.BRONZE,
  termDays = DEFAULT_TERM_DAYS,
}: FactoringParams): FactoringResult => {
  // Calculate maximum allowed amount
  const maxAllowedAmount = (employeeSalary * MAX_ADVANCE_PERCENTAGE) / 100

  // Validate and adjust requested amount if needed
  const advanceAmount = Math.min(requestedAmount, maxAllowedAmount)

  // Calculate processing fee
  let processingFee = 0
  let flatFeeApplied = false

  if (advanceAmount < MINIMUM_FEE_THRESHOLD) {
    processingFee = FLAT_FEE
    flatFeeApplied = true
  } else {
    processingFee = (advanceAmount * TIER_PROCESSING_FEES[membershipTier]) / 100
  }

  // Calculate total amount
  const totalAmount = advanceAmount + processingFee

  // Calculate due date
  const dueDate = calculateDueDate(new Date(), termDays)

  // Calculate effective rate
  const effectiveRate = calculateEffectiveRate(advanceAmount, processingFee, termDays)

  // Generate payment schedule
  const paymentSchedule = {
    dueDate,
    amount: advanceAmount,
    processingFee,
    totalDue: totalAmount,
  }

  return {
    advanceAmount,
    processingFee,
    totalAmount,
    dueDate,
    effectiveRate,
    breakdown: {
      maxAllowedAmount,
      processingFeeRate: TIER_PROCESSING_FEES[membershipTier],
      flatFeeApplied,
      paymentSchedule,
    },
  }
}

// Helper function to calculate due date considering holidays and weekends
export const calculateDueDate = (startDate: Date, termDays: number): Date => {
  const dueDate = new Date(startDate)
  let remainingDays = termDays

  while (remainingDays > 0) {
    dueDate.setDate(dueDate.getDate() + 1)
    if (isWorkingDay(dueDate)) {
      remainingDays--
    }
  }

  return dueDate
}

// Helper function to check if date is a working day
export const isWorkingDay = (date: Date): boolean => {
  const day = date.getDay()
  return day !== 0 && day !== 6 // 0 is Sunday, 6 is Saturday
}

// Helper function to calculate effective annual rate
export const calculateEffectiveRate = (
  principal: number,
  fee: number,
  termDays: number,
): number => {
  const rate = (fee / principal) * (365 / termDays) * 100
  return Number(rate.toFixed(2))
}

// Utility function to validate advance request
export const validateAdvanceRequest = (
  salary: number,
  requestedAmount: number,
  previousAdvances: number[],
): {
  isValid: boolean
  maxAmount: number
  message: string
} => {
  const maxAmount = (salary * MAX_ADVANCE_PERCENTAGE) / 100

  if (requestedAmount > maxAmount) {
    return {
      isValid: false,
      maxAmount,
      message: `Advance cannot exceed ${MAX_ADVANCE_PERCENTAGE}% of salary (PHP${maxAmount.toFixed(2)})`,
    }
  }

  // Check total outstanding advances
  const totalOutstanding = previousAdvances.reduce((sum, advance) => sum + advance, 0)
  if (totalOutstanding + requestedAmount > salary) {
    return {
      isValid: false,
      maxAmount: salary - totalOutstanding,
      message: 'Total advances would exceed monthly salary',
    }
  }

  return {
    isValid: true,
    maxAmount,
    message: 'Advance request is valid',
  }
}

// Utility function to check advance frequency
export const checkAdvanceFrequency = (
  previousAdvanceDates: Date[],
  currentDate: Date = new Date(),
  minDaysBetween: number = 7,
): {
  canRequest: boolean
  nextEligibleDate?: Date
  message: string
} => {
  if (previousAdvanceDates.length === 0) {
    return {
      canRequest: true,
      message: 'First advance request',
    }
  }

  const lastAdvanceDate = new Date(Math.max(...previousAdvanceDates.map((d) => d.getTime())))
  const daysSinceLastAdvance = Math.floor(
    (currentDate.getTime() - lastAdvanceDate.getTime()) / (1000 * 60 * 60 * 24),
  )

  if (daysSinceLastAdvance < minDaysBetween) {
    const nextEligibleDate = new Date(lastAdvanceDate)
    nextEligibleDate.setDate(nextEligibleDate.getDate() + minDaysBetween)

    return {
      canRequest: false,
      nextEligibleDate,
      message: `Must wait ${minDaysBetween - daysSinceLastAdvance} more days before next advance`,
    }
  }

  return {
    canRequest: true,
    message: 'Eligible for new advance',
  }
}

export const PayrollFactoring: CollectionConfig = {
  slug: 'payroll-factoring',

  admin: {
    useAsTitle: 'factorUUID',
    group: 'Calculations',
  },

  access: {
    create: calculationAccess,
    read: calculationAccess,
    update: calculationAccess,
    delete: calculationAccess,
  },

  fields: [
    {
      name: 'factorUUID',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        readOnly: true,
      },
      hooks: {
        beforeChange: [({ value }) => value || `FAC-${uuidv4()}`],
      },
    },
    {
      name: 'companyUUID',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
    },
    // ... rest of your existing fields ...
  ],

  hooks: {
    beforeChange: [
      async ({ req, operation, data }) => {
        if (operation === 'create') {
          data.createdBy = req.user?.id
        }
        data.lastUpdatedBy = req.user?.id
        return data
      },
    ],
  },
}

// Remove any default export if it exists
