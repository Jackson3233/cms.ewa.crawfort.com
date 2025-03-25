// src/collections/Users.ts
import { CollectionConfig, PayloadRequest } from 'payload'
import { v4 as uuidv4 } from 'uuid'
import { hash } from 'bcryptjs'
import crypto from 'crypto'
import {
  isAdmin,
  isCompanyStaff,
  AccessLevel,
  UserPermissions,
  adminOnlyFieldAccess,
  CustomUser,
} from '../../access/accessControl'
import { sendPasswordEmail } from '../../utilities/email'

const apiKeyAuth = (req: PayloadRequest): boolean => {
  return req.headers.get('x-api-key') === process.env.API_SECRET_KEY
}

const Users: CollectionConfig = {
  slug: 'users',

  // ===========================
  // 🔐 AUTHENTICATION CONFIG
  // ===========================
  auth: {
    // Enable email verification
    verify: true,
    // Configure forgot password
    forgotPassword: {
      // Token expiration in milliseconds (24 hours)
      expiration: 24 * 60 * 60 * 1000,
    },
    // Set token expiration (in seconds)
    tokenExpiration: 28800, // 8 hours in seconds
    // Explicitly include JWT tokens in responses
    cookies: {
      secure: process.env.COOKIE_SECURE === 'true',
      sameSite:
        process.env.COOKIE_SAME_SITE === 'None'
          ? 'None'
          : process.env.COOKIE_SAME_SITE === 'Lax'
            ? 'Lax'
            : process.env.COOKIE_SAME_SITE === 'Strict'
              ? 'Strict'
              : 'None',
      domain: process.env.COOKIE_DOMAIN || undefined,
    },
  },

  // ===========================
  // 🛡️ ACCESS CONTROL RULES
  // ===========================
  access: {
    admin: ({ req }: { req: PayloadRequest }): boolean => {
      if (apiKeyAuth(req)) return true // ✅ API key allows deleting users
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      // Only allow admin/staff roles to access admin panel
      return isAdmin(user) || isCompanyStaff(user)
    },
    read: ({ req }: { req: PayloadRequest }): boolean => {
      if (apiKeyAuth(req)) return true // ✅ API key allows deleting users
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      if (isAdmin(user) || isCompanyStaff(user)) return true
      return Boolean(user?.id === req.user?.id)
    },
    create: ({ req }: { req: PayloadRequest }): boolean => {
      if (apiKeyAuth(req)) return true // ✅ API key allows deleting users
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user)
    },
    update: ({ req }: { req: PayloadRequest }): boolean => {
      if (apiKeyAuth(req)) return true // ✅ API key allows deleting users
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      if (isAdmin(user)) return true
      return Boolean(user?.id === req.user?.id)
    },
    delete: ({ req }: { req: PayloadRequest }): boolean => {
      if (apiKeyAuth(req)) return true // ✅ API key allows deleting users
      if (!req.user) return false
      const user = { ...req.user, collection: 'users' } as CustomUser
      return isAdmin(user)
    },
  },

  // ===========================
  // 📋 ADMIN UI CONFIG
  // ===========================
  admin: {
    useAsTitle: 'name',
    group: 'Core',
    defaultColumns: ['email', 'name', 'role', 'status'],
  },

  // ===========================
  // 📝 FIELD DEFINITIONS
  // ===========================
  fields: [
    // Base User Information
    {
      name: 'userId',
      type: 'text',
      required: true,
      unique: true,
      saveToJWT: true,
    },
    {
      name: 'email',
      type: 'email',
      required: true,
      unique: true,
    },
    {
      name: 'name',
      type: 'text',
      required: true,
    },
    {
      name: 'role',
      type: 'select',
      saveToJWT: true,
      required: true,
      access: {
        update: ({ req }): boolean => {
          if (!req.user) return false
          const user = { ...req.user, collection: 'users' } as CustomUser
          return isAdmin(user)
        },
      },
      options: [
        { label: 'Admin', value: 'admin' },
        { label: 'Staff', value: 'staff' },
        { label: 'Employer', value: 'employer' },
        { label: 'Employee', value: 'employee' },
        { label: 'User', value: 'user' },
      ],
    },
    {
      name: 'status',
      type: 'select',
      saveToJWT: true,
      defaultValue: 'active',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
        { label: 'Suspended', value: 'suspended' },
      ],
      access: {
        update: ({ req }): boolean => {
          if (!req.user) return false
          const user = { ...req.user, collection: 'users' } as CustomUser
          return isAdmin(user)
        },
      },
    },
    {
      name: 'companyUUID',
      type: 'text',
      saveToJWT: true,
      required: false,
      admin: {
        condition: (data) => ['employer', 'employee'].includes(data?.role),
      },
    },
    {
      name: 'permissions',
      type: 'select',
      hasMany: true,
      saveToJWT: true,
      options: [
        { label: 'Payroll Access', value: UserPermissions.PAYROLL_ACCESS },
        { label: 'Payroll Admin', value: UserPermissions.PAYROLL_ADMIN },
      ],
      admin: {
        condition: (data) => [AccessLevel.STAFF, AccessLevel.ADMIN].includes(data?.role),
      },
    },

    // System Fields
    {
      name: 'lastLogin',
      type: 'date',
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'loginAttempts',
      type: 'number',
      defaultValue: 0,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'lockUntil',
      type: 'date',
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'createdAt',
      type: 'date',
      admin: {
        readOnly: true,
      },
      hooks: {
        beforeChange: [
          ({ value }) => {
            if (!value) {
              return new Date().toISOString()
            }
            return value
          },
        ],
      },
    },
    {
      name: 'updatedAt',
      type: 'date',
      admin: {
        readOnly: true,
      },
      hooks: {
        beforeChange: [() => new Date().toISOString()],
      },
    },

    // Relationships - only visible to admins
    {
      name: 'employeeProfile',
      type: 'relationship',
      relationTo: 'employees',
      hasMany: false,
      admin: {
        condition: (data: { role?: string }) => data?.role === AccessLevel.EMPLOYEE,
        hidden: false,
      },
    },
    {
      name: 'employerProfile',
      type: 'relationship',
      relationTo: 'employers',
      hasMany: false,
      admin: {
        condition: (data: { role?: string }) => data?.role === AccessLevel.EMPLOYER,
        hidden: false,
      },
    },

    // Investment Details
    {
      name: 'investmentDetails',
      type: 'group',
      admin: {
        condition: (data) => data.role === 'investor',
      },
      fields: [
        {
          name: 'totalInvestment',
          type: 'number',
          defaultValue: 0,
        },
        {
          name: 'expectedReturnRate',
          type: 'number',
        },
        {
          name: 'profitDistributionType',
          type: 'select',
          options: [
            { label: 'Fixed', value: 'fixed' },
            { label: 'Variable', value: 'variable' },
          ],
        },
      ],
    },

    // Factoring Settings
    {
      name: 'membershipTier',
      type: 'select',
      defaultValue: 'bronze',
      options: [
        { label: 'Bronze', value: 'bronze' },
        { label: 'Silver', value: 'silver' },
        { label: 'Gold', value: 'gold' },
        { label: 'Platinum', value: 'platinum' },
      ],
      admin: {
        condition: (data) => ['employer', 'employee'].includes(data.role),
      },
    },
    {
      name: 'advanceLimit',
      type: 'number',
      min: 0,
      max: 90,
      defaultValue: 30,
      admin: {
        condition: (data) => data.role === 'employee',
      },
    },
    {
      name: 'previousDefaults',
      type: 'number',
      defaultValue: 0,
      admin: {
        readOnly: true,
        condition: (data) => data.role === 'employee',
      },
    },
    {
      name: 'lastRepaymentStatus',
      type: 'select',
      options: [
        { label: 'On Time', value: 'ontime' },
        { label: 'Late', value: 'late' },
        { label: 'Default', value: 'default' },
      ],
      admin: {
        readOnly: true,
        condition: (data) => data.role === 'employee',
      },
    },

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
      name: 'mobileNumber',
      type: 'text',
      required: false,
      admin: {
        position: 'sidebar',
      },
    },
    // Add a field to track if a welcome email was sent
    {
      name: 'welcomeEmailSent',
      type: 'checkbox',
      defaultValue: false,
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },
  ],

  // ===========================
  // 🪝 HOOKS
  // ===========================
  hooks: {
    beforeChange: [
      async ({ operation, data }) => {
        if (operation === 'create') {
          data.userId = `USR-${uuidv4()}`
          data.createdAt = new Date().toISOString()
          data.authProvider = data.authProvider || 'local'
        }
        data.updatedAt = new Date().toISOString()
        return data
      },
    ],
    afterChange: [
      async ({ doc, operation, req }) => {
        if (operation === 'create' && doc.authProvider === 'local' && !doc.welcomeEmailSent) {
          try {
            console.log(`[📩] Sending welcome email to: ${doc.email}`)

            const generatedPassword = crypto.randomBytes(8).toString('hex')
            const hashedPassword = await hash(generatedPassword, 10)

            if (!doc.id) {
              console.error(`[❌] User ID missing, skipping email.`)
              return
            }

            await req.payload.update({
              collection: 'users',
              id: doc.id,
              data: {
                password: hashedPassword,
                welcomeEmailSent: true,
              },
            })

            await sendPasswordEmail(doc.email, generatedPassword)
            console.log(`[✅] Welcome email sent successfully to: ${doc.email}`)
          } catch (error) {
            console.error(`[❌] Error sending welcome email:`, error)
          }
        }
      },
    ],
    afterLogin: [
      async ({ req, user }) => {
        try {
          await req.payload.update({
            collection: 'users',
            id: user.id,
            data: {
              lastLogin: new Date().toISOString(),
              loginAttempts: 0,
              lockUntil: null,
            },
          })
        } catch (error) {
          console.error('Error updating user after login:', error)
        }
      },
    ],
    beforeLogin: [
      async ({ user }) => {
        const now = new Date()
        if (user.lockUntil && now < new Date(user.lockUntil)) {
          throw new Error('Account is locked. Please try again later.')
        }
      },
    ],
  },
}

export default Users
