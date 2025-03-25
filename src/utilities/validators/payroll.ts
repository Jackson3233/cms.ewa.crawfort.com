// ===========================
// 📝 PAYROLL VALIDATOR - Payload CMS v3+ Optimized
// ===========================
// Purpose: Validate payroll-related transactions
// Business Rules:
// - Maximum 90% of salary for advances
// - Membership tiers: Bronze (5%), Silver (4.5%), Gold (4%), Platinum (3%)
// - Default tenure: 2 weeks (14 days)
// - Interest starts only after first repayment
// - Company-wide utilization thresholds
// - Risk-based restrictions
// Author: Your Name
// Last Updated: 2024
// ===========================

import { MembershipTier } from './payroll_financial'
import { TIER_PROCESSING_FEES } from './payroll_financial'

export interface PayrollValidationRules {
  maxAdvancePercentage: number
  maxTermDays: number
  minimumFeeThreshold: number
  flatFeeAmount: number
  defaultTenureDays: number
}

export const DEFAULT_PAYROLL_RULES: PayrollValidationRules = {
  maxAdvancePercentage: 90, // Max 90% of salary
  maxTermDays: 180, // Max 6 months
  minimumFeeThreshold: 100, // PHP100 threshold for flat fee
  flatFeeAmount: 38, // PHP38 flat fee
  defaultTenureDays: 14, // 2 weeks default
}

export interface Employee {
  id: string
  salary: number
  membershipTier: MembershipTier
  // ... other employee fields
}

export interface PayrollAdvanceRequest {
  employeeSalary: number
  requestedAmount: number
  membershipTier: MembershipTier
  proposedTenure: number
  workingDaysCompleted: number
  payrollStartDate: Date
  payrollEndDate: Date
  lastRepaymentStatus?: 'on-time' | 'late' | 'default'
  previousAdvances?: {
    amount: number
    status: 'pending' | 'approved' | 'disbursed' | 'repaid' | 'defaulted'
    date: Date
  }[]
}

export interface PayrollValidationResult {
  isValid: boolean
  eligible: boolean
  reason?: string
  errors: string[]
  warnings: string[]
  processingFee: number
  effectiveRate: number
  maxAllowedAmount: number
  isHighRisk: boolean
  restrictions?: {
    maxAdvancePercentage: number
  }
}

export const validatePayrollAdvance = (
  request: PayrollAdvanceRequest,
  rules: PayrollValidationRules = DEFAULT_PAYROLL_RULES,
): PayrollValidationResult => {
  const errors: string[] = []
  const warnings: string[] = []
  let processingFee = 0
  let isHighRisk = false
  let restrictions

  // Calculate max allowed advance
  const maxAllowedAmount = (request.employeeSalary * rules.maxAdvancePercentage) / 100

  // Validate requested amount
  if (request.requestedAmount > maxAllowedAmount) {
    errors.push(
      `Advance cannot exceed ${rules.maxAdvancePercentage}% of salary (PHP${maxAllowedAmount.toFixed(2)})`,
    )
  }

  // Calculate processing fee based on membership tier
  processingFee =
    request.requestedAmount < rules.minimumFeeThreshold
      ? rules.flatFeeAmount
      : (request.requestedAmount * TIER_PROCESSING_FEES[request.membershipTier]) / 100

  // Calculate effective rate
  const effectiveRate = (processingFee / request.requestedAmount) * 100

  // Validate tenure
  if (request.proposedTenure > rules.maxTermDays) {
    errors.push(`Term cannot exceed ${rules.maxTermDays} days`)
  }

  if (request.proposedTenure < 1) {
    errors.push('Term must be at least 1 day')
  }

  // Risk assessment (weighted scoring system)
  const riskScore = (() => {
    let score = 100

    // Penalize defaults
    const defaults = request.previousAdvances?.filter((a) => a.status === 'defaulted').length || 0
    score -= defaults * 20

    // Penalize late payments
    if (request.lastRepaymentStatus === 'late') {
      score -= 10
    }
    // Penalize frequent advances
    const numAdvances = request.previousAdvances?.length ?? 0
    if (numAdvances > 5) {
      score -= (numAdvances - 5) * 5
    }

    return Math.max(0, score)
  })()

  isHighRisk = riskScore < 50

  if (isHighRisk) {
    restrictions = {
      maxAdvancePercentage: rules.maxAdvancePercentage * 0.5, // Reduce max advance for high risk
    }
  }

  return {
    isValid: errors.length === 0,
    eligible: errors.length === 0 && !isHighRisk,
    reason: errors.length > 0 ? errors[0] : undefined,
    errors,
    warnings,
    processingFee,
    effectiveRate,
    maxAllowedAmount,
    isHighRisk,
    restrictions,
  }
}

// ===========================
// 🔍 COMPANY-WIDE ADVANCE UTILIZATION
// ===========================

export interface CompanyAdvanceMetrics {
  totalEmployees: number
  totalSalary: number
  activeAdvances: number
  totalAdvanceAmount: number
  workforceUtilization: number
}

export const validateCompanyAdvanceLimit = async (
  metrics: CompanyAdvanceMetrics,
  requestedAmount: number,
  userRole: string,
): Promise<{
  isAllowed: boolean
  requiresApproval: boolean
  approvalLevel: 'auto' | 'manual' | 'admin'
  message: string
  adminOverride?: boolean
}> => {
  const newTotalAmount = metrics.totalAdvanceAmount + requestedAmount
  const newUtilization = (newTotalAmount / metrics.totalSalary) * 100

  if (newUtilization > 70) {
    return {
      isAllowed: userRole === 'admin',
      requiresApproval: true,
      approvalLevel: userRole === 'admin' ? 'manual' : 'admin',
      adminOverride: userRole === 'admin',
      message:
        userRole === 'admin'
          ? 'Admin override allowed'
          : 'Requires admin approval - High utilization',
    }
  }

  if (newUtilization > 50) {
    return {
      isAllowed: true,
      requiresApproval: true,
      approvalLevel: 'manual',
      message: 'Requires manual approval - Moderate workforce utilization (>50%)',
    }
  }

  return {
    isAllowed: true,
    requiresApproval: false,
    approvalLevel: 'auto',
    message: 'Advance request within acceptable limits',
  }
}

// ===========================
// 🔍 CREDIT SCORING BASED ON REPAYMENT TRENDS
// ===========================

export interface CreditScoring {
  dpd: number
  riskScore: number
  previousDefaults: number
}

export const calculateCreditScore = (
  paymentHistory: { dueDate: Date; paymentDate: Date | null; amount: number }[],
): CreditScoring => {
  let dpd = 0
  let riskScore = 100
  let defaults = 0

  paymentHistory.forEach((payment) => {
    if (!payment.paymentDate) {
      const currentDpd = Math.floor(
        (new Date().getTime() - new Date(payment.dueDate).getTime()) / (1000 * 60 * 60 * 24),
      )
      dpd = Math.max(dpd, currentDpd)
      if (currentDpd > 90) defaults++
    }
  })

  riskScore = Math.max(0, Math.min(100, 100 - dpd * 0.2 - defaults * 20))

  return { dpd, riskScore, previousDefaults: defaults }
}

// ===========================
// 🔍 MEMBERSHIP TIER EVALUATION
// ===========================

export const evaluateMembershipTier = (
  currentTier: MembershipTier,
  creditScore: CreditScoring,
  advanceHistory: number,
): { newTier: MembershipTier; reason: string } => {
  if (creditScore.dpd > 30) {
    return { newTier: MembershipTier.BRONZE, reason: 'Downgraded due to payment delays' }
  }
  if (creditScore.riskScore >= 90 && advanceHistory >= 20) {
    return { newTier: MembershipTier.PLATINUM, reason: 'Excellent standing' }
  }
  if (creditScore.riskScore >= 80 && advanceHistory >= 15) {
    return { newTier: MembershipTier.GOLD, reason: 'Very good history' }
  }
  return { newTier: MembershipTier.SILVER, reason: 'Good standing' }
}
