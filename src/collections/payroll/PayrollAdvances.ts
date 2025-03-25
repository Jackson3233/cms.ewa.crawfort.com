/* eslint-disable @typescript-eslint/no-explicit-any */
// ===========================
// 💼 PAYROLL ADVANCES
// ===========================
// Purpose: Track employee salary advances
// Business Rules:
// - Maximum 90% of earned salary
// - Based on working days completed
// - Interest and processing fee calculation
// - Repayment tracking
// Author: Your Name
// Last Updated: 2024
// ===========================

import { CollectionConfig, Where } from 'payload'
import {
  isAdmin,
  isCompanyStaff,
  isEmployer,
  isEmployee,
  CustomUser,
} from '../../access/accessControl'
import {
  validateFinancialTransaction,
  MembershipTier,
  FinancialValidationParams,
} from '../../utilities/validators/payroll_financial'
import { Employee } from '../../utilities/validators/payroll'

export const PayrollAdvances: CollectionConfig = {
  slug: 'payroll-advances',

  admin: {
    useAsTitle: 'advanceId',
    group: 'Payroll',
  },
  access: {
    read: ({ req }: { req: { user: any } }): Where | boolean => {
      if (!req.user) return false

      const user = { ...req.user, collection: 'users' } as CustomUser

      if (isCompanyStaff(user)) return true

      if (isEmployer(user)) {
        return {
          companyUUID: {
            equals: user.companyUUID,
          },
        } as Where
      }

      if (isEmployee(user)) {
        return {
          employeeId: {
            equals: user.id,
          },
        } as Where
      }

      return false
    },
    create: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user) || isEmployer(user)
    },
    update: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user)
    },
    delete: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user)
    },
  },

  fields: [
    // Identification
    {
      name: 'advanceId',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'employeeId',
      type: 'relationship',
      relationTo: 'employees',
      required: true,
    },
    {
      name: 'companyUUID',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
    },

    // Advance Details
    {
      name: 'requestedAmount',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'approvedAmount',
      type: 'number',
      min: 0,
    },
    {
      name: 'processingFee',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'netDisbursementAmount',
      type: 'number',
      min: 0,
    },
    {
      name: 'workingDaysCompleted',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'earnedSalaryAmount',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'repaymentDueDate',
      type: 'date',
      required: true,
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      defaultValue: 'requested',
      options: [
        { label: 'Requested', value: 'requested' },
        { label: 'Approved', value: 'approved' },
        { label: 'Disbursed', value: 'disbursed' },
        { label: 'Repaid', value: 'repaid' },
        { label: 'Defaulted', value: 'defaulted' },
      ],
    },

    // Dates
    {
      name: 'requestDate',
      type: 'date',
      required: true,
      defaultValue: () => new Date(),
    },
    {
      name: 'approvalDate',
      type: 'date',
    },
    {
      name: 'disbursementDate',
      type: 'date',
    },

    // System Fields
    {
      name: 'createdBy',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'lastUpdatedBy',
      type: 'relationship',
      relationTo: 'users',
      admin: {
        readOnly: true,
      },
    },

    // Add missing fields to match Employee collection
    {
      name: 'membershipTier',
      type: 'select',
      required: true,
      options: [
        { label: 'Bronze', value: MembershipTier.BRONZE },
        { label: 'Silver', value: MembershipTier.SILVER },
        { label: 'Gold', value: MembershipTier.GOLD },
        { label: 'Platinum', value: MembershipTier.PLATINUM },
      ],
    },
    {
      name: 'payrollPeriod',
      type: 'group',
      fields: [
        {
          name: 'startDate',
          type: 'date',
          required: true,
        },
        {
          name: 'endDate',
          type: 'date',
          required: true,
        },
      ],
    },
  ],

  hooks: {
    beforeChange: [
      async ({ req, operation, data }) => {
        if (operation === 'create') {
          data.advanceId = `ADV-${Date.now().toString(36).toUpperCase()}`
          data.createdBy = req.user?.id

          const employee = (await req.payload.findByID({
            collection: 'employees',
            id: data.employeeId,
          })) as unknown as Employee

          const validationParams: FinancialValidationParams = {
            amount: data.requestedAmount,
            salaryDetails: {
              monthlySalary: employee.salary,
              workingDaysCompleted: data.workingDaysCompleted,
              payrollStartDate: data.payrollPeriod.startDate,
              payrollEndDate: data.payrollPeriod.endDate,
            },
            membershipTier: employee.membershipTier,
          }

          const validation = validateFinancialTransaction(validationParams)

          if (!validation.isValid) {
            throw new Error(validation.errors.join(', '))
          }

          data.processingFee = validation.processingFee
          data.netDisbursementAmount = data.requestedAmount - validation.processingFee
          data.earnedSalaryAmount = validation.earnedSalary
          data.membershipTier = employee.membershipTier
        }

        data.lastUpdatedBy = req.user?.id
        return data
      },
    ],
  },
}
