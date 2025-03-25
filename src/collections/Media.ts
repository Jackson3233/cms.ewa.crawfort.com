import type { CollectionConfig } from 'payload'
import { CustomUser } from '../access/accessControl'

import {
  FixedToolbarFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'
import path from 'path'
import { fileURLToPath } from 'url'

import { isAdmin, isCompanyStaff, isEmployer } from '../access/accessControl'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export const Media: CollectionConfig = {
  slug: 'media',
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
  fields: [
    {
      name: 'alt',
      type: 'text',
      required: true,
    },
    {
      name: 'caption',
      type: 'richText',
      editor: lexicalEditor({
        features: ({ rootFeatures }) => {
          return [...rootFeatures, FixedToolbarFeature(), InlineToolbarFeature()]
        },
      }),
    },
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
  ],
  upload: {
    staticDir: path.resolve(dirname, '../../public/media'),
    adminThumbnail: 'thumbnail',
    focalPoint: true,
    imageSizes: [
      {
        name: 'thumbnail',
        width: 300,
      },
      {
        name: 'square',
        width: 500,
        height: 500,
      },
      {
        name: 'small',
        width: 600,
      },
      {
        name: 'medium',
        width: 900,
      },
      {
        name: 'large',
        width: 1400,
      },
      {
        name: 'xlarge',
        width: 1920,
      },
      {
        name: 'og',
        width: 1200,
        height: 630,
        crop: 'center',
      },
    ],
  },
  hooks: {
    beforeChange: [
      ({ req, data }) => {
        const user = req.user as CustomUser | null
        if (!user) return data

        if (isEmployer(user)) {
          data.companyUUID = user.companyUUID
        }
        return data
      },
    ],
  },
}
