/* eslint-disable @typescript-eslint/no-explicit-any */
// ===========================
// 💳 PAYROLL TRANSACTIONS
// ===========================
// Purpose: Track all financial transactions
// Business Rules:
// - Transaction tracking
// - Payment reconciliation
// - Audit trail
// - Multi-party transactions
// Author: Your Name
// Last Updated: 2024
// ===========================

import { CollectionConfig, Where } from 'payload'
import { isAdmin, isEmployer, isEmployee, CustomUser } from '../../access/accessControl'

export const PayrollTransactions: CollectionConfig = {
  slug: 'payroll-transactions',
  admin: {
    useAsTitle: 'transactionId',
    group: 'Financial',
  },
  access: {
    read: ({ req }: { req: { user?: any } }): Where | boolean => {
      if (!req.user) return false

      const user = { ...req.user, collection: 'users' } as CustomUser
      if (isAdmin(user)) return true

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
      return isAdmin(user)
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
    {
      name: 'transactionId',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'companyUUID',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
    },
    {
      name: 'employeeId',
      type: 'relationship',
      relationTo: 'employees',
      required: true,
    },
    {
      name: 'advanceId',
      type: 'relationship',
      relationTo: 'payroll-advances',
      admin: {
        condition: (data) =>
          data.transactionType === 'disbursement' || data.transactionType === 'repayment',
      },
    },
    {
      name: 'repaymentId',
      type: 'relationship',
      relationTo: 'payroll-repayments',
      admin: {
        condition: (data) => data.transactionType === 'repayment',
      },
    },
    {
      name: 'transactionDate',
      type: 'date',
      required: true,
    },
    {
      name: 'transactionType',
      type: 'select',
      required: true,
      options: [
        { label: 'Disbursement', value: 'disbursement' },
        { label: 'Repayment', value: 'repayment' },
        { label: 'Fee', value: 'fee' },
      ],
    },
    {
      name: 'amount',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'paymentStatus',
      type: 'select',
      required: true,
      defaultValue: 'processing',
      options: [
        { label: 'Processing', value: 'processing' },
        { label: 'Completed', value: 'completed' },
        { label: 'Failed', value: 'failed' },
        { label: 'Pending', value: 'pending' },
        { label: 'Cancelled', value: 'cancelled' },
      ],
    },
    {
      name: 'bankDetails',
      type: 'group',
      fields: [
        {
          name: 'bankName',
          type: 'text',
        },
        {
          name: 'accountNumber',
          type: 'text',
          admin: {
            description: 'Last 4 digits only',
          },
        },
        {
          name: 'routingNumber',
          type: 'text',
        },
        {
          name: 'referenceNumber',
          type: 'text',
        },
      ],
    },
    {
      name: 'reconciliationStatus',
      type: 'select',
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Matched', value: 'matched' },
        { label: 'Unmatched', value: 'unmatched' },
        { label: 'Reconciled', value: 'reconciled' },
      ],
    },
    {
      name: 'fees',
      type: 'array',
      fields: [
        {
          name: 'feeType',
          type: 'select',
          options: [
            { label: 'Processing Fee', value: 'processing' },
            { label: 'Wire Fee', value: 'wire' },
            { label: 'Late Fee', value: 'late' },
            { label: 'Other', value: 'other' },
          ],
          required: true,
        },
        {
          name: 'amount',
          type: 'number',
          required: true,
          min: 0,
        },
        {
          name: 'description',
          type: 'text',
        },
      ],
    },
    {
      name: 'metadata',
      type: 'group',
      fields: [
        {
          name: 'initiatedBy',
          type: 'relationship',
          relationTo: 'users',
        },
        {
          name: 'approvedBy',
          type: 'relationship',
          relationTo: 'users',
        },
        {
          name: 'notes',
          type: 'textarea',
        },
        {
          name: 'attachments',
          type: 'array',
          fields: [
            {
              name: 'file',
              type: 'upload',
              relationTo: 'media',
            },
            {
              name: 'description',
              type: 'text',
            },
          ],
        },
      ],
    },
    {
      name: 'createdAt',
      type: 'date',
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'updatedAt',
      type: 'date',
      admin: {
        readOnly: true,
      },
    },
  ],
  hooks: {
    beforeChange: [
      async ({ data, operation }) => {
        if (operation === 'create') {
          data.transactionId = `TXN-${Date.now()}`
          data.createdAt = new Date()
        }
        data.updatedAt = new Date()
        return data
      },
    ],
  },
}
