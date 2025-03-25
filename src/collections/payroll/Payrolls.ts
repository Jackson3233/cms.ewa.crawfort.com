/* eslint-disable @typescript-eslint/no-explicit-any */
import { CollectionConfig } from 'payload'
import { isAdmin, isCompanyStaff, isEmployer, CustomUser } from '../../access/accessControl'

export const Payrolls: CollectionConfig = {
  slug: 'payrolls',

  admin: {
    useAsTitle: 'payrollId',
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
      name: 'payrollId',
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
