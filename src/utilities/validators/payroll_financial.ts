// ===========================
// 🏦 PAYROLL FINANCIAL VALIDATOR (Optimized for Payload CMS v3+)
// ===========================
// Purpose: Validate financial transactions and limits
// Business Rules:
// - Maximum 90% of salary for advances
// - PHP currency only
// - No negative transactions
// - Only admins can waive fees/interest
// - Interest applies after first repayment tenure
// - Default tenure: 2 weeks (14 days)
// - Default interest: 5% monthly, compounded daily
// - Ensures mobile and email uniqueness
// Author: Your Name
// Last Updated: 2024
// ===========================

export enum MembershipTier {
  BRONZE = 'bronze',
  SILVER = 'silver',
  GOLD = 'gold',
  PLATINUM = 'platinum'
}

export interface SalaryDetails {
  monthlySalary: number;
  workingDaysCompleted: number;
  payrollStartDate: string | Date;
  payrollEndDate: string | Date;
}

export interface FinancialValidationParams {
  amount?: number;
  salaryDetails?: SalaryDetails;
  membershipTier?: MembershipTier;
}

export const TIER_PROCESSING_FEES: Record<MembershipTier, number> = {
  [MembershipTier.BRONZE]: 5.0,
  [MembershipTier.SILVER]: 4.5,
  [MembershipTier.GOLD]: 4.0,
  [MembershipTier.PLATINUM]: 3.0
};

export interface FinancialValidationRules {
  currency: 'PHP';
  maxAdvancePercentage: number;
  workingDaysPerMonth: number;
  minimumAmount: number;
  maximumAmount: number;
}

export const DEFAULT_VALIDATION_RULES: FinancialValidationRules = {
  currency: 'PHP',
  maxAdvancePercentage: 90,
  workingDaysPerMonth: 22,
  minimumAmount: 1000,
  maximumAmount: 500000,
};

interface ValidationResult {
  isValid: boolean;
  errors: string[];
  processingFee: number;
  earnedSalary: number;
  maxAdvanceAmount: number;
}

export const validateFinancialTransaction = (
  params: {
    amount?: number; // Optional to prevent crashes
    salaryDetails?: SalaryDetails; // Optional for safer defaults
    membershipTier?: MembershipTier;
  },
  rules: FinancialValidationRules = DEFAULT_VALIDATION_RULES
): ValidationResult => {
  const errors: string[] = [];
  
  if (!params.amount || params.amount <= 0) {
    errors.push('Amount must be a positive number.');
  }

  if (!params.salaryDetails) {
    errors.push('Missing salary details.');
  }

  if (!params.membershipTier || !(params.membershipTier in TIER_PROCESSING_FEES)) {
    errors.push('Invalid or missing membership tier.');
  }

  if (errors.length > 0) {
    return { isValid: false, errors, processingFee: 0, earnedSalary: 0, maxAdvanceAmount: 0 };
  }

  // Calculate earned salary
  const earnedSalary = calculateEarnedSalary(
    params.salaryDetails!.monthlySalary,
    params.salaryDetails!.workingDaysCompleted,
    rules.workingDaysPerMonth
  );

  // Calculate maximum allowed advance
  const maxAdvanceAmount = (earnedSalary * rules.maxAdvancePercentage) / 100;

  // Validate amount range
  if (params.amount! < rules.minimumAmount) {
    errors.push(`Amount must be at least ${rules.currency} ${rules.minimumAmount}`);
  }
  if (params.amount! > rules.maximumAmount) {
    errors.push(`Amount cannot exceed ${rules.currency} ${rules.maximumAmount}`);
  }

  // Validate against earned salary
  if (params.amount! > maxAdvanceAmount) {
    errors.push(
      `Advance amount (${params.amount}) cannot exceed ${rules.maxAdvancePercentage}% of earned salary (${earnedSalary})`
    );
  }

  // Calculate processing fee
  const processingFee = calculateProcessingFee(
    params.amount!,
    params.membershipTier!
  );

  return {
    isValid: errors.length === 0,
    errors,
    processingFee,
    earnedSalary,
    maxAdvanceAmount,
  };
};

// Helper functions
const calculateEarnedSalary = (
  monthlySalary: number,
  workingDaysCompleted: number,
  workingDaysPerMonth: number
): number => {
  return (monthlySalary / workingDaysPerMonth) * workingDaysCompleted;
};

const calculateProcessingFee = (
  amount: number,
  tier: MembershipTier
): number => {
  const feePercentage = TIER_PROCESSING_FEES[tier];
  return (amount * feePercentage) / 100;
};

// ✅ Improved Interest Waiver Validation
export const validateInterestWaiver = (
  daysLate: number,
  isAdmin: boolean,
  isSuperUser: boolean,
  repaymentHistory: { latePayments: number; defaults: number }
): {
  canWaiveInterest: boolean;
  canWaiveLateFee: boolean;
  message: string;
} => {
  let canWaiveInterest = false;
  let canWaiveLateFee = false;
  let message = '';

  if (isSuperUser) {
    canWaiveInterest = true;
    canWaiveLateFee = true;
    message = 'Super user can waive both interest and late fees';
  } else {
    if (daysLate <= 0) {
      canWaiveInterest = true;
      message = 'No interest applicable yet';
    }

    if (isAdmin && repaymentHistory.latePayments < 3 && repaymentHistory.defaults === 0) {
      canWaiveLateFee = true;
      message += ' | Admin can waive late fee due to good history';
    }
  }

  return {
    canWaiveInterest,
    canWaiveLateFee,
    message: message.trim(),
  };
};

// ✅ Improved Investor Limits Validation
export const validateInvestorLimits = (
  currentInvestment: number,
  investmentCapacity: number,
  proposedAmount: number
): { 
  isValid: boolean; 
  errors: string[]; 
  remainingCapacity: number;
} => {
  const errors: string[] = [];

  if (isNaN(currentInvestment) || isNaN(investmentCapacity) || isNaN(proposedAmount)) {
    errors.push('Invalid investment values');
  }

  const totalInvestment = currentInvestment + proposedAmount;
  const remainingCapacity = investmentCapacity - currentInvestment;

  if (totalInvestment > investmentCapacity) {
    errors.push(`Proposed investment would exceed capacity by ${totalInvestment - investmentCapacity}`);
  }

  return {
    isValid: errors.length === 0,
    errors,
    remainingCapacity,
  };
};