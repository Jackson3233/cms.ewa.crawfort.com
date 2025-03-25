import { CollectionConfig } from 'payload'
import {
  calculationAccess,
  sensitiveFieldAccess,
  adminOnlyFieldAccess,
} from '../../access/accessControl'

export const FactoringCalculations: CollectionConfig = {
  slug: 'factoring-calculations',

  admin: {
    useAsTitle: 'advanceId',
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
      name: 'advanceId',
      type: 'text',
      required: true,
      unique: true,
    },
    {
      name: 'employerId',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
    },
    {
      name: 'payrollId',
      type: 'relationship',
      relationTo: 'payrolls',
      required: true,
    },
    {
      name: 'riskScore',
      type: 'number',
      min: 0,
      max: 100,
      access: {
        read: ({ req }) => Boolean(sensitiveFieldAccess({ req })), // ✅ Ensures boolean
        update: ({ req }) => Boolean(adminOnlyFieldAccess({ req })), // ✅ Ensures boolean
      },
    },
    {
      name: 'riskCategory',
      type: 'select',
      options: [
        { label: 'Low Risk', value: 'lowRisk' },
        { label: 'Medium Risk', value: 'mediumRisk' },
        { label: 'High Risk', value: 'highRisk' },
      ],
      access: {
        read: ({ req }) => Boolean(sensitiveFieldAccess({ req })), // ✅ Ensures boolean
        update: ({ req }) => Boolean(adminOnlyFieldAccess({ req })), // ✅ Ensures boolean
      },
    },
  ],

  hooks: {
    beforeChange: [
      async ({ req, operation, data }) => {
        if (req.user) {
          if (operation === 'create') {
            data.createdBy = req.user.id
          }
          data.lastUpdatedBy = req.user.id
        }
        return data
      },
    ],
  },
}
