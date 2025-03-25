/* eslint-disable @typescript-eslint/no-explicit-any */
// src/access/accessControl.ts

import { PayloadRequest, Where } from 'payload'
import { User, Employee, Employer } from '../payload-types'

// Define user roles
export enum AccessLevel {
  ADMIN = 'admin',
  STAFF = 'staff',
  EMPLOYER = 'employer',
  EMPLOYEE = 'employee',
  USER = 'user',
}

// Define user permissions
export enum UserPermissions {
  PAYROLL_ACCESS = 'payroll_access',
  PAYROLL_ADMIN = 'payroll_admin',
}

// Update the CustomUser type to be a union of possible user types
export type CustomUser = (
  | (User & { collection: 'users' })
  | (Employer & { collection: 'employers' })
  | (Employee & { collection: 'employees' })
) & {
  role: 'admin' | 'user' | 'staff' | 'employer' | 'employee'
}

type AccessResult = boolean | Where

// Type for access control function parameters
interface AccessArgs {
  req: PayloadRequest
}

// Helper to assert user type
const assertUser = (user: any): CustomUser => {
  if (!user || !user.role) {
    throw new Error('Invalid user')
  }
  return user as CustomUser
}

// ===========================
// 🔐 Role Check Functions
// ===========================
export const isAdmin = (user: CustomUser): boolean => {
  return user.role === 'admin'
}

export const isCompanyStaff = (user: CustomUser): boolean => {
  return user.role === 'staff'
}

export const isEmployer = (user: CustomUser): boolean => {
  return user.role === 'employer'
}

export const isEmployee = (user: CustomUser): boolean => {
  return user.role === 'employee'
}

// ===========================
// 🔐 Access Control Functions
// ===========================
export const adminOnlyAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  return isAdmin(req.user as CustomUser)
}

export const staffAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  return isCompanyStaff(req.user as CustomUser)
}

export const employerAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  const user = assertUser(req.user)

  if (isAdmin(user)) return true
  if (isEmployer(user)) {
    // For collection access, we just want to know if they have any access
    return true
  }
  return false
}

export const employeeAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  const user = assertUser(req.user)
  return isAdmin(user) || isEmployee(user)
}

// ===========================
// 🔐 Field Access Functions
// ===========================
export const adminOnlyFieldAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  const user = assertUser(req.user)
  return isAdmin(user)
}

export const sensitiveFieldAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  const user = assertUser(req.user)
  return isAdmin(user) || isCompanyStaff(user)
}

export const employerFieldAccess = ({ req }: AccessArgs): AccessResult => {
  if (!req.user) return false
  const user = assertUser(req.user)

  if (isAdmin(user)) return true

  if (isEmployer(user)) {
    return {
      companyUUID: { equals: user.companyUUID },
    }
  }

  return false
}

export const employeeFieldAccess = ({ req }: AccessArgs): boolean => {
  if (!req.user) return false
  const user = assertUser(req.user)
  return isEmployee(user)
}

/**
 * 🔹 Calculation Access Control
 * Controls access to factoring and payroll calculations
 * - Admins have full access
 * - Staff can read and create
 * - Employers can only see their company's calculations
 * - Employees can only see their own calculations
 */
export const calculationAccess = ({ req }: AccessArgs): AccessResult => {
  if (!req.user) return false
  const user = assertUser(req.user)

  // Admin has full access
  if (isAdmin(user)) return true

  // Staff can read and create
  if (isCompanyStaff(user)) {
    return {
      or: [{ createdBy: { equals: user.id } }, { companyUUID: { exists: true } }],
    }
  }

  // Employers can see their company's calculations
  if (isEmployer(user)) {
    return {
      companyUUID: { equals: user.companyUUID },
    }
  }

  // Employees can only see their own calculations
  if (isEmployee(user)) {
    return {
      createdBy: { equals: user.id },
    }
  }

  // Default: no access
  return false
}