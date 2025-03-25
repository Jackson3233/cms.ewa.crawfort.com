import type { CollectionConfig } from 'payload'
import { CustomUser } from '../access/accessControl'

import { slugField } from '@/fields/slug'
import { isAdmin, isCompanyStaff, isEmployer } from '../access/accessControl'

export const Categories: CollectionConfig = {
  slug: 'categories',
  access: {
    read: () => true, // Public readable
    create: (args) => {
      const user = args.req.user as CustomUser | null
      if (!user) return false
      return isAdmin(user) || isCompanyStaff(user)
    },
    update: (args) => {
      const user = args.req.user as CustomUser | null
      if (!user) return false
      return isAdmin(user) || isCompanyStaff(user)
    },
    delete: (args) => {
      const user = args.req.user as CustomUser | null
      if (!user) return false
      return isAdmin(user)
    },
  },
  admin: {
    useAsTitle: 'name',
    group: 'Content',
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
    },
    {
      name: 'description',
      type: 'textarea',
    },
    ...slugField(),
    {
      name: 'companyUUID',
      type: 'text',
      required: true,
      admin: {
        readOnly: true,
      },
      hooks: {
        beforeChange: [
          ({ req, data }) => {
            const user = req.user as CustomUser | null
            if (!user) return data?.companyUUID
            if (isEmployer(user)) {
              return user.companyUUID
            }
            return data?.companyUUID
          },
        ],
      },
    },
    {
      name: 'active',
      type: 'checkbox',
      defaultValue: true,
      admin: {
        description: 'Controls whether this category is active',
      },
    },
  ],
  hooks: {
    beforeChange: [
      ({ req, data }) => {
        const user = req.user as CustomUser | null
        if (!user) return data

        if (isEmployer(user)) {
          data.companyUUID = user.companyUUID
        }
        data.updatedAt = new Date().toISOString()
        return data
      },
    ],
    beforeValidate: [
      ({ data }) => {
        if (!data) return data
        if (!data.createdAt) {
          data.createdAt = new Date().toISOString()
        }
        return data
      },
    ],
  },
}

export default Categories
