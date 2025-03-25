// ===========================
// 💰 PAYROLL REPAYMENT
// ===========================
// Purpose: Calculate repayment amounts, interest, and late fees
// Business Rules:
// - No minimum amount (flat fee PHP38 if below PHP100)
// - Interest only applies after first repayment tenure
// - Only super users can waive interest past due date
// - Users can waive late fee within 3 working days
// - Default interest: 5% monthly, compounded daily
// - Membership tiers affect processing fees:
//   • Bronze: 5%
//   • Silver: 4.5%
//   • Gold: 4%
//   • Platinum: 3%
// Author: Your Name
// Last Updated: 2024
// ===========================

import { MembershipTier, TIER_PROCESSING_FEES } from '../../utilities/validators/payroll_financial'

export interface RepaymentParams {
  advanceAmount: number
  originalDueDate: Date
  paymentDate: Date
  isAdmin: boolean
  isSuperUser: boolean
  waiveInterest?: boolean
  waiveLateFee?: boolean
  membershipTier: MembershipTier
  isFirstRepayment: boolean
  companyUUID: string
}

export interface RepaymentResult {
  principalAmount: number
  interestAmount: number
  lateFee: number
  processingFee: number
  totalAmount: number
  daysLate: number
  workingDaysLate: number
  isGracePeriod: boolean
  canWaiveLateFee: boolean
  canWaiveInterest: boolean
  breakdown: {
    principal: number
    interest: number
    lateFee: number
    processingFee: number
    total: number
    effectiveApr: number
  }
}

// Constants
const MONTHLY_INTEREST_RATE = 5 // 5% per month
const WORKING_DAYS_GRACE = 3
const LATE_FEE_PERCENTAGE = 1 // 1% late fee
const MINIMUM_FEE_THRESHOLD = 100 // PHP
const FLAT_FEE = 38 // PHP

export const calculateRepayment = ({
  advanceAmount,
  originalDueDate,
  paymentDate,
  isAdmin,
  isSuperUser,
  waiveInterest = false,
  waiveLateFee = false,
  membershipTier,
  isFirstRepayment,
}: RepaymentParams): RepaymentResult => {
  const msPerDay = 1000 * 60 * 60 * 24
  const daysLate = Math.floor((paymentDate.getTime() - originalDueDate.getTime()) / msPerDay)

  // Calculate working days late
  const workingDaysLate = getWorkingDaysBetween(originalDueDate, paymentDate)
  const isGracePeriod = workingDaysLate <= WORKING_DAYS_GRACE

  // Determine waiver permissions
  const canWaiveLateFee = isAdmin || isGracePeriod
  const canWaiveInterest = isSuperUser

  let interestAmount = 0
  let lateFee = 0
  let processingFee = 0

  // Calculate processing fee based on tier and amount
  if (advanceAmount < MINIMUM_FEE_THRESHOLD) {
    processingFee = FLAT_FEE
  } else {
    processingFee = (advanceAmount * TIER_PROCESSING_FEES[membershipTier]) / 100
  }

  if (daysLate > 0 && !isFirstRepayment) {
    // Calculate interest for late payment
    if (!waiveInterest || !canWaiveInterest) {
      const dailyInterestRate = MONTHLY_INTEREST_RATE / 30 / 100 // Daily compound rate
      interestAmount = advanceAmount * Math.pow(1 + dailyInterestRate, daysLate) - advanceAmount
    }

    // Calculate late fee
    if (!waiveLateFee || !canWaiveLateFee) {
      lateFee = (advanceAmount * LATE_FEE_PERCENTAGE) / 100
    }
  }

  // Calculate total and effective APR
  const totalAmount = advanceAmount + interestAmount + lateFee + processingFee
  const effectiveApr = calculateEffectiveAPR(
    advanceAmount,
    totalAmount,
    daysLate || 1, // Avoid division by zero
  )

  return {
    principalAmount: advanceAmount,
    interestAmount,
    lateFee,
    processingFee,
    totalAmount,
    daysLate,
    workingDaysLate,
    isGracePeriod,
    canWaiveLateFee,
    canWaiveInterest,
    breakdown: {
      principal: advanceAmount,
      interest: interestAmount,
      lateFee,
      processingFee,
      total: totalAmount,
      effectiveApr,
    },
  }
}

// Helper function to calculate effective APR
const calculateEffectiveAPR = (principal: number, total: number, days: number): number => {
  const rate = ((total - principal) / principal) * (365 / days) * 100
  return Number(rate.toFixed(2))
}

// Helper function to check if date is a working day
export const isWorkingDay = (date: Date): boolean => {
  const day = date.getDay()
  return day !== 0 && day !== 6 // 0 is Sunday, 6 is Saturday
}

// Helper function to calculate working days between dates
export const getWorkingDaysBetween = (startDate: Date, endDate: Date): number => {
  let count = 0
  const tempDate = new Date(startDate)

  while (tempDate <= endDate) {
    if (isWorkingDay(tempDate)) {
      count++
    }
    tempDate.setDate(tempDate.getDate() + 1)
  }

  return count
}

// Utility function for tenure changes
export const updateCompanyTenure = (
  newTenure: number,
  isAdmin: boolean,
  lastChangeDate?: Date,
): {
  isAllowed: boolean
  newTenure?: number
  message: string
} => {
  if (!isAdmin && lastChangeDate) {
    return {
      isAllowed: false,
      message: 'Only administrators can modify tenure after initial setting',
    }
  }

  // Validate tenure format (must be in days)
  if (newTenure % 1 !== 0 || newTenure < 1) {
    return {
      isAllowed: false,
      message: 'Tenure must be a whole number of days',
    }
  }

  return {
    isAllowed: true,
    newTenure,
    message: 'Tenure updated successfully',
  }
}
