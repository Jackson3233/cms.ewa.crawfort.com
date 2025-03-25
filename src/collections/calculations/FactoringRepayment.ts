// ===========================
// 💸 FACTORING REPAYMENTS (CALCULATIONS BUT NAME SHORTENED DUE TO LIMIT)
// ===========================
// Purpose: Track factoring repayments
// Business Rules:
// - Payment scheduling
// - Late fee calculation
// - Payment status tracking
// - Default handling
// Author: Your Name
// Last Updated: 2024
// ===========================

import { CollectionConfig } from 'payload'
import { calculationAccess } from '../../access/accessControl'
import { v4 as uuidv4 } from 'uuid'

export const FactoringRepayments: CollectionConfig = {
  slug: 'factoring-repayments',
  admin: {
    useAsTitle: 'repaymentId',
    group: 'Factoring',
  },
  access: {
    create: calculationAccess,
    read: calculationAccess,
    update: calculationAccess,
    delete: calculationAccess,
  },
  fields: [
    {
      name: 'repaymentId',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        readOnly: true,
      },
      hooks: {
        beforeChange: [({ value }) => value || `REP-${uuidv4()}`],
      },
    },
    {
      name: 'advanceId',
      type: 'relationship',
      relationTo: 'factoring-calculations',
      required: true,
    },
    {
      name: 'companyUUID',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
    },
    {
      name: 'scheduledPaymentDate',
      type: 'date',
      required: true,
    },
    {
      name: 'actualPaymentDate',
      type: 'date',
    },
    {
      name: 'totalAmountDue',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'totalAmountPaid',
      type: 'number',
      defaultValue: 0,
      min: 0,
    },
    {
      name: 'paymentStatus',
      type: 'select',
      required: true,
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Paid', value: 'paid' },
        { label: 'Overdue', value: 'overdue' },
        { label: 'Defaulted', value: 'defaulted' },
        { label: 'Partially Paid', value: 'partially_paid' },
      ],
    },
    {
      name: 'amountDue',
      type: 'group',
      fields: [
        {
          name: 'principal',
          type: 'number',
          required: true,
          min: 0,
        },
        {
          name: 'interest',
          type: 'number',
          required: true,
          min: 0,
        },
        {
          name: 'fees',
          type: 'number',
          defaultValue: 0,
          min: 0,
        },
      ],
    },
    {
      name: 'amountPaid',
      type: 'group',
      fields: [
        {
          name: 'principal',
          type: 'number',
          defaultValue: 0,
          min: 0,
        },
        {
          name: 'interest',
          type: 'number',
          defaultValue: 0,
          min: 0,
        },
        {
          name: 'fees',
          type: 'number',
          defaultValue: 0,
          min: 0,
        },
      ],
    },
    {
      name: 'lateFees',
      type: 'array',
      fields: [
        {
          name: 'feeDate',
          type: 'date',
          required: true,
        },
        {
          name: 'feeType',
          type: 'select',
          options: [
            { label: 'Fixed', value: 'fixed' },
            { label: 'Percentage', value: 'percentage' },
          ],
          required: true,
        },
        {
          name: 'feeAmount',
          type: 'number',
          required: true,
          min: 0,
        },
        {
          name: 'paid',
          type: 'checkbox',
          defaultValue: false,
        },
      ],
    },
    {
      name: 'paymentHistory',
      type: 'array',
      fields: [
        {
          name: 'paymentDate',
          type: 'date',
          required: true,
        },
        {
          name: 'amount',
          type: 'number',
          required: true,
          min: 0,
        },
        {
          name: 'paymentMethod',
          type: 'select',
          options: [
            { label: 'Bank Transfer', value: 'bank' },
            { label: 'Direct Debit', value: 'debit' },
            { label: 'Check', value: 'check' },
          ],
          required: true,
        },
        {
          name: 'referenceNumber',
          type: 'text',
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
      async ({ req, operation, data }) => {
        if (operation === 'create') {
          data.createdBy = req.user?.id
          data.repaymentId = data.repaymentId || `REP-${uuidv4()}`
        }
        data.lastUpdatedBy = req.user?.id
        return data
      },
    ],
  },
}
