/* eslint-disable @typescript-eslint/no-explicit-any */
// src/collections/Employer.ts
import { CollectionConfig, PayloadRequest } from 'payload'
import { v4 as uuidv4 } from 'uuid'
import crypto from 'crypto'
import {
  employerAccess,
  sensitiveFieldAccess,
  isAdmin,
  adminOnlyFieldAccess,
} from '../../access/accessControl'
import type { CustomUser } from '../../access/accessControl'
import { sendPasswordEmail } from '../../utilities/email'
import { hash } from 'bcryptjs'

const Employer: CollectionConfig = {
  slug: 'employers',

  // ===========================
  // 🔐 AUTHENTICATION CONFIG
  // ===========================
  auth: {
    tokenExpiration: 7200, // 2 hours
    verify: false,
    maxLoginAttempts: 10,
    lockTime: 600 * 1000, // 10 minutes
    cookies: {
      secure: true,
      sameSite: 'None',
      domain: process.env.COOKIE_DOMAIN || undefined,
    },
    useAPIKey: true, // Enable API-only authentication
  },

  // ===========================
  // 🛡️ ACCESS CONTROL RULES
  // ===========================
  access: {
    // Prevent access to admin UI completely
    admin: () => false,

    // Read access:
    // - Admin: Full access
    // - Company Staff: Can view everything but can't edit
    // - Employer: Can only view their own profile
    read: ({ req }: { req: PayloadRequest }): boolean => {
      if (!req.user) return false
      return employerAccess({ req })
    },

    // Create access:
    // - Admin: Can create any employer
    // - Others: Cannot create
    create: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      const user = req.user as CustomUser
      return isAdmin(user)
    },

    // Update access:
    // - Admin: Can update any employer
    // - Employer: Can update their own basic info
    // - Company Staff: Cannot update
    update: ({ req }: { req: PayloadRequest }): boolean => {
      if (!req.user) return false
      return employerAccess({ req })
    },

    // Delete access:
    // - Admin only
    delete: ({ req }: { req: PayloadRequest }): boolean => {
      if (!req.user) return false
      const user = req.user as CustomUser
      return isAdmin(user)
    },
  },

  // ===========================
  // 📋 ADMIN UI CONFIG
  // ===========================
  admin: {
    useAsTitle: 'companyName',
    group: 'Core',
    description: 'Employer accounts (API access only)',
  },

  // ===========================
  // 📝 FIELD DEFINITIONS
  // ===========================
  fields: [
    // Authentication Fields
    {
      name: 'authProvider',
      type: 'select',
      required: true,
      defaultValue: 'local',
      options: [
        { label: 'Local', value: 'local' },
        { label: 'Google', value: 'google' },
        { label: 'Facebook', value: 'facebook' },
      ],
      access: {
        update: adminOnlyFieldAccess,
      },
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },
    {
      name: 'googleId',
      type: 'text',
      admin: {
        position: 'sidebar',
        readOnly: true,
        condition: (data) => data.authProvider === 'google',
      },
    },
    {
      name: 'facebookId',
      type: 'text',
      admin: {
        position: 'sidebar',
        readOnly: true,
        condition: (data) => data.authProvider === 'facebook',
      },
    },
    {
      name: 'avatar',
      type: 'upload',
      relationTo: 'media',
      admin: {
        description: 'Company logo or profile picture (automatically set for social login users)',
      },
    },

    // Link to User
    {
      name: 'userId',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      hasMany: false,
      admin: {
        description: 'Associated user account',
      },
    },

    // Identification
    // -------------
    {
      name: 'companyName',
      type: 'text',
      required: true,
    },
    {
      name: 'companyUUID',
      type: 'text',
      unique: true,
      admin: {
        description: 'Company ID (leave blank to auto-generate, or enter a custom ID)',
        readOnly: true,
      },
      hooks: {
        beforeValidate: [
          ({ value }) => {
            // Allow empty on create - will be filled in beforeChange
            return value || undefined
          },
        ],
      },
    },
    {
      name: 'registrationNumber',
      type: 'text',
      required: true,
      unique: true,
    },

    // Contact Information
    // ------------------
    {
      name: 'email',
      type: 'email',
      required: true,
      unique: true,
    },
    {
      name: 'phoneNumber',
      type: 'text',
      required: true,
    },
    {
      name: 'address',
      type: 'group',
      fields: [
        {
          name: 'street',
          type: 'text',
          required: true,
        },
        {
          name: 'barangay',
          type: 'text',
          required: true,
        },
        {
          name: 'cityDistrict',
          type: 'text',
          required: true,
        },
        {
          name: 'province',
          type: 'text',
          required: true,
        },
        {
          name: 'zipCode',
          type: 'text',
          required: true,
        },
      ],
    },

    // Company Details
    // --------------
    {
      name: 'businessType',
      type: 'select',
      required: true,
      options: [
        { label: 'Corporation', value: 'corporation' },
        { label: 'Partnership', value: 'partnership' },
        { label: 'Sole Proprietorship', value: 'soleProprietorship' },
      ],
    },
    {
      name: 'industry',
      type: 'text',
      required: true,
    },
    {
      name: 'payrollProvider',
      type: 'text',
      admin: {
        description: 'External payroll integration provider',
      },
    },

    // Authentication Details
    // --------------------
    {
      name: 'status',
      type: 'select',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
        { label: 'Suspended', value: 'suspended' },
      ],
      defaultValue: 'active',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'lastLogin',
      type: 'date',
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },
    {
      name: 'loginAttempts',
      type: 'number',
      defaultValue: 0,
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },
    {
      name: 'lockUntil',
      type: 'date',
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },

    // Business Details
    // --------------
    {
      name: 'payrollSettings',
      type: 'group',
      fields: [
        {
          name: 'payrollCycle',
          type: 'select',
          options: [
            { label: 'Monthly', value: 'monthly' },
            { label: 'Semi-Monthly', value: 'semi_monthly' },
            { label: 'Weekly', value: 'weekly' },
            { label: 'Bi-Weekly', value: 'bi_weekly' },
          ],
          required: true,
        },
        {
          name: 'payrollDates',
          type: 'array',
          fields: [
            {
              name: 'date',
              type: 'number',
              required: true,
              min: 1,
              max: 31,
            },
          ],
        },
      ],
    },

    // Factoring Details
    // ---------------
    {
      name: 'factoringAgreementSigned',
      type: 'checkbox',
      defaultValue: false,
      access: {
        update: sensitiveFieldAccess,
      },
    },
    {
      name: 'creditLimit',
      type: 'number',
      required: true,
      min: 0,
    },

    // Banking Details
    // -------------
    {
      name: 'bankDetails',
      type: 'group',
      fields: [
        {
          name: 'bankName',
          type: 'text',
          required: true,
        },
        {
          name: 'accountNumber',
          type: 'text',
          required: true,
        },
        {
          name: 'accountName',
          type: 'text',
          required: true,
        },
      ],
    },

    // Risk Assessment
    {
      name: 'riskAssessment',
      type: 'group',
      fields: [
        {
          name: 'creditScore',
          type: 'number',
          min: 0,
          max: 1000,
        },
        {
          name: 'riskCategory',
          type: 'select',
          options: [
            { label: 'Low Risk', value: 'lowRisk' },
            { label: 'Medium Risk', value: 'mediumRisk' },
            { label: 'High Risk', value: 'highRisk' },
          ],
        },
      ],
    },

    // Risk Profile
    {
      name: 'riskProfile',
      type: 'group',
      admin: {
        description: 'Risk assessment and credit profile',
      },
      fields: [
        {
          name: 'creditLimit',
          type: 'number',
          required: true,
          defaultValue: 0,
        },
        {
          name: 'riskRating',
          type: 'select',
          options: [
            { label: 'AAA', value: 'AAA' },
            { label: 'AA', value: 'AA' },
            { label: 'A', value: 'A' },
            { label: 'BBB', value: 'BBB' },
            { label: 'BB', value: 'BB' },
            { label: 'B', value: 'B' },
            { label: 'CCC', value: 'CCC' },
            { label: 'CC', value: 'CC' },
            { label: 'C', value: 'C' },
            { label: 'D', value: 'D' },
          ],
        },
        {
          name: 'riskScore',
          type: 'number',
          min: 0,
          max: 100,
        },
        {
          name: 'lastAssessmentDate',
          type: 'date',
        },
      ],
    },

    // Risk Metrics
    {
      name: 'riskMetrics',
      type: 'group',
      admin: {
        description: 'Key risk indicators',
      },
      fields: [
        {
          name: 'defaultProbability',
          type: 'number',
          min: 0,
          max: 1,
        },
        {
          name: 'lossGivenDefault',
          type: 'number',
          min: 0,
          max: 1,
        },
        {
          name: 'exposureAtDefault',
          type: 'number',
          min: 0,
        },
        {
          name: 'expectedCreditLoss',
          type: 'number',
          min: 0,
        },
      ],
    },

    // Factoring Configuration
    {
      name: 'factoringSettings',
      type: 'group',
      fields: [
        {
          name: 'enabled',
          type: 'checkbox',
          defaultValue: false,
        },
        {
          name: 'maxAdvancePercentage',
          type: 'number',
          min: 0,
          max: 90,
          defaultValue: 90,
        },
        {
          name: 'defaultTenureDays',
          type: 'number',
          min: 1,
          max: 180,
          defaultValue: 14,
        },
        {
          name: 'minDaysBetweenAdvances',
          type: 'number',
          min: 1,
          defaultValue: 7,
        },
      ],
      access: {
        update: sensitiveFieldAccess,
      },
    },

    // Factoring Statistics
    {
      name: 'factoringStats',
      type: 'group',
      fields: [
        {
          name: 'totalAdvanceAmount',
          type: 'number',
          defaultValue: 0,
        },
        {
          name: 'outstandingAdvances',
          type: 'number',
          defaultValue: 0,
        },
        {
          name: 'averageRepaymentTime',
          type: 'number',
          defaultValue: 0,
        },
        {
          name: 'lastAdvanceDate',
          type: 'date',
        },
      ],
      admin: {
        readOnly: true,
      },
    },

    // Created and Updated Dates
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

    // Company Fields
    {
      name: 'companyDetails',
      type: 'group',
      access: {
        read: async () => true,
        update: async () => true,
      },
      fields: [
        // ... company fields ...
      ],
    },

    // Sensitive Fields
    {
      name: 'financialInfo',
      type: 'group',
      access: {
        read: adminOnlyFieldAccess,
        update: adminOnlyFieldAccess,
      },
      fields: [
        // ... financial fields ...
      ],
    },
  ],

  // ===========================
  // 🪝 HOOKS
  // ===========================
  hooks: {
    beforeChange: [
      async ({ req, operation, data }) => {
        if (operation === 'create') {
          // Check for existing employer before creating
          const existingEmployer = await req.payload.find({
            collection: 'employers',
            where: {
              or: [
                { email: { equals: data.email } },
                { registrationNumber: { equals: data.registrationNumber } },
              ],
            },
          })

          if (existingEmployer.docs.length > 0) {
            throw new Error('Company with this email or registration number already exists')
          }

          // Check if companyUUID is provided and ensure uniqueness
          if (data.companyUUID) {
            const existingUUID = await req.payload.find({
              collection: 'employers',
              where: {
                companyUUID: { equals: data.companyUUID },
              },
            })

            if (existingUUID.docs.length > 0) {
              throw new Error('Company ID already exists. Please choose a different one.')
            }
          } else {
            // Auto-generate if not provided
            data.companyUUID = `COM-${uuidv4()}`
          }

          // Ensure createdAt is set
          data.createdAt = new Date().toISOString()
        }

        // Ensure updatedAt is always updated
        data.updatedAt = new Date().toISOString()

        return data
      },
    ],

    afterChange: [
      async ({ doc, operation, req }) => {
        if (operation === 'create' && doc.authProvider === 'local') {
          const generatedPassword = crypto.randomBytes(8).toString('hex')
          const hashedPassword = await hash(generatedPassword, 10)

          // Ensure password is set immediately after user creation
          await req.payload.update({
            collection: 'employers',
            id: doc.id,
            data: {
              password: hashedPassword,
            },
          })

          // Send password email notification
          await sendPasswordEmail(doc.email, generatedPassword)
        }
      },
    ],
    afterLogin: [
      async ({ req, user }) => {
        try {
          await req.payload.update({
            collection: 'employers',
            id: user.id,
            data: {
              loginAttempts: 0,
              lockUntil: null,
              lastLogin: new Date().toISOString(),
            },
          })
        } catch (error) {
          console.error('Error in afterLogin hook:', error)
        }
      },
    ],
    afterLogout: [
      async ({ req }) => {
        // This hook runs after a successful logout
        console.log('Employer logged out successfully')
      },
    ],
  },

  // ===========================
  // 🛣️ ENDPOINTS
  // ===========================
  endpoints: [
    // PayloadCMS already provides login/logout endpoints automatically
    // The following paths are available:
    // - POST /api/employers/login
    // - POST /api/employers/logout
    // - GET /api/employers/me
    // - GET /api/employers/access
  ],
}

export default Employer
