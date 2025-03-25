/* eslint-disable @typescript-eslint/no-explicit-any */
import { CollectionConfig } from 'payload'
import { isAdmin, isCompanyStaff, isEmployer, CustomUser } from '../../access/accessControl'

export const PayrollRepayments: CollectionConfig = {
  slug: 'payroll-repayments',

  admin: {
    useAsTitle: 'repaymentId',
    group: 'Payroll',
  },
  access: {
    create: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user) || isCompanyStaff(user)
    },
    read: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user) || isCompanyStaff(user) || isEmployer(user)
    },
    update: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user) || isCompanyStaff(user)
    },
    delete: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user)
    },
  },

  fields: [
    {
      name: 'repaymentId',
      type: 'text',
      required: true,
      unique: true,
    },
    {
      name: 'advanceId',
      type: 'relationship',
      relationTo: 'payroll-advances',
      required: true,
    },
    // ... rest of your fields ...
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
