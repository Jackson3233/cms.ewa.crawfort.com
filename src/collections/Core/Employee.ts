/* eslint-disable @typescript-eslint/no-explicit-any */
// src/collections/Employee.ts
import { CollectionConfig, FieldAccess } from 'payload'
import { v4 as uuidv4 } from 'uuid'
import crypto from 'crypto'
import { validatePayrollAdvance } from '../../utilities/validators/payroll'
import { sendPasswordEmail } from '../../utilities/email'
import {
  isAdmin,
  isEmployer,
  employeeAccess,
  sensitiveFieldAccess,
  adminOnlyFieldAccess,
  employeeFieldAccess,
  CustomUser,
} from '../../access/accessControl'
import { hash } from 'bcryptjs'
import { MembershipTier } from '../../utilities/validators/payroll_financial'

const Employee: CollectionConfig = {
  slug: 'employees',

  // ===========================
  // 🔐 AUTHENTICATION CONFIG
  // ===========================
  auth: {
    tokenExpiration: 7200,
    verify: false,
    maxLoginAttempts: 10,
    lockTime: 600 * 1000,
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
    // - Employer: Can only view their employees' basic and payroll info
    // - Employee: Can only view their own profile
    read: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      return employeeAccess({ req })
    },

    // Create access:
    // - Admin: Can create any employee (but admins aren't employees)
    // - Employer: Can only create employees for their company
    create: ({ req }: { req: { user: any } }): boolean => {
      if (!req.user) return false
      return isAdmin(req.user as CustomUser) || isEmployer(req.user as CustomUser)
    },

    // Update access:
    // - Admin: Can update any employee
    // - Employer: Can update basic/payroll info of their employees
    // - Employee: Can update their own basic info ONLY
    update: ({ req }: { req: any }): boolean => {
      if (!req.user) return false
      return employeeAccess({ req })
    },

    // Delete access:
    // - Admin only
    delete: ({ req }: { req: { user: any } }): boolean => {
      if (!req.user) return false
      return isAdmin(req.user as CustomUser)
    },
  },

  // ===========================
  // 📋 ADMIN UI CONFIG
  // ===========================
  admin: {
    useAsTitle: 'fullName',
    group: 'Core',
    defaultColumns: ['employeeUuid', 'fullName', 'email', 'status'],
    description: 'Employee accounts (API access only)',
  },

  // ===========================
  // 📝 FIELD DEFINITIONS
  // ===========================
  fields: [
    // Identification & System Fields
    {
      name: 'employeeUuid',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'userId',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      hasMany: false,
      admin: {
        readOnly: true,
        description: 'Associated user account',
      },
    },
    {
      name: 'employerId',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
      hasMany: false,
    },
    {
      name: 'employeeId',
      type: 'text',
      required: true,
      unique: true,
      admin: {
        description: 'Company-specific Employee ID',
      },
    },

    // Personal Information
    {
      name: 'firstName',
      type: 'text',
      required: true,
    },
    {
      name: 'middleName',
      type: 'text',
    },
    {
      name: 'lastName',
      type: 'text',
      required: true,
    },
    {
      name: 'suffixes',
      type: 'text',
    },
    {
      name: 'fullName',
      type: 'text',
      required: true,
    },
    {
      name: 'dateOfBirth',
      type: 'date',
      required: true,
    },
    {
      name: 'maritalStatus',
      type: 'select',
      options: [
        { label: 'Single', value: 'single' },
        { label: 'Married', value: 'married' },
        { label: 'Widowed', value: 'widowed' },
        { label: 'Divorced', value: 'divorced' },
      ],
      required: true,
    },

    // Contact Information
    {
      name: 'email',
      type: 'email',
      required: true,
      unique: true,
    },
    {
      name: 'mobileNumber',
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
          label: 'Street / House/Building No.',
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
          label: 'City/District',
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

    // Employment Details
    {
      name: 'employerProfile',
      type: 'relationship',
      relationTo: 'employers',
    },
    {
      name: 'companyUUID',
      type: 'relationship',
      relationTo: 'employers',
      required: true,
    },
    {
      name: 'department',
      type: 'text',
      required: true,
    },
    {
      name: 'position',
      type: 'text',
      required: true,
    },
    {
      name: 'employmentType',
      type: 'select',
      required: true,
      options: [
        { label: 'Full Time', value: 'full_time' },
        { label: 'Part Time', value: 'part_time' },
        { label: 'Contract', value: 'contract' },
      ],
    },
    {
      name: 'employmentStatus',
      type: 'select',
      options: [
        { label: 'Regular', value: 'regular' },
        { label: 'Probationary', value: 'probationary' },
        { label: 'Contract', value: 'contract' },
        { label: 'Part-time', value: 'part_time' },
      ],
      required: true,
    },
    {
      name: 'jobTitle',
      type: 'text',
      required: true,
    },
    {
      name: 'basicMonthlyPayNet',
      type: 'number',
      required: true,
      min: 0,
    },
    {
      name: 'paymentDetails',
      type: 'group',
      fields: [
        {
          name: 'bankName',
          type: 'text',
          required: true,
          label: 'Payroll Bank Name / E-Wallet Name',
        },
        {
          name: 'accountNumber',
          type: 'text',
          required: true,
          label: 'Bank Account Number / Registered E-Wallet Number',
        },
      ],
    },

    // Salary & Payment Details
    {
      name: 'salary',
      type: 'number',
      required: true,
      min: 0,
      admin: {
        description: 'Monthly base salary',
      },
    },
    {
      name: 'startDate',
      type: 'date',
      required: true,
    },

    // Advance & Credit Settings
    {
      name: 'advanceSettings',
      type: 'group',
      fields: [
        {
          name: 'advanceLimit',
          type: 'number',
          required: true,
          min: 0,
          max: 90,
          defaultValue: 30,
        },
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

    // Bank Account Details
    {
      name: 'bankDetails',
      type: 'group',
      access: {
        read: ({ req }): boolean => {
          if (!req.user) return false
          return employeeAccess({ req })
        },
        update: ({ req }): boolean => {
          if (!req.user) return false
          return sensitiveFieldAccess({ req })
        },
      },
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
        {
          name: 'accountType',
          type: 'select',
          required: true,
          options: [
            { label: 'Savings', value: 'savings' },
            { label: 'Checking', value: 'checking' },
            { label: 'Payroll', value: 'payroll' },
          ],
        },
      ],
    },

    // Authentication Details
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
        update: ({ req }) => (req.user ? adminOnlyFieldAccess({ req }) : false),
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
      name: 'status',
      type: 'select',
      required: true,
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Active', value: 'active' },
        { label: 'Suspended', value: 'suspended' },
      ],
      access: {
        update: ({ req }) => (req.user ? sensitiveFieldAccess({ req }) : false),
      },
      admin: {
        position: 'sidebar',
      },
    },

    // System Fields
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

    // Factoring Details
    {
      name: 'advanceHistory',
      type: 'array',
      admin: {
        readOnly: true,
      },
      fields: [
        {
          name: 'advanceId',
          type: 'relationship',
          relationTo: 'payroll-advances',
        },
        {
          name: 'amount',
          type: 'number',
        },
        {
          name: 'date',
          type: 'date',
        },
        {
          name: 'status',
          type: 'select',
          options: [
            { label: 'Pending', value: 'pending' },
            { label: 'Approved', value: 'approved' },
            { label: 'Rejected', value: 'rejected' },
            { label: 'Disbursed', value: 'disbursed' },
            { label: 'Completed', value: 'completed' },
          ],
        },
      ],
    },
    {
      name: 'employmentDuration',
      type: 'number',
      min: 0,
      admin: {
        description: 'Duration in months',
      },
    },
    {
      name: 'performanceScore',
      type: 'number',
      min: 0,
      max: 100,
    },

    // Timestamps
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

    // Loan Access
    {
      name: 'loanAccess',
      type: 'group',
      admin: {
        condition: (data) => data.role === 'employee',
      },
      fields: [
        {
          name: 'isApproved',
          type: 'checkbox',
          defaultValue: false,
        },
        {
          name: 'approvedBy',
          type: 'relationship',
          relationTo: 'users',
          admin: {
            readOnly: true,
            condition: (data) => data.loanAccess?.isApproved,
          },
        },
        {
          name: 'approvalDate',
          type: 'date',
          admin: {
            readOnly: true,
            condition: (data) => data.loanAccess?.isApproved,
          },
        },
        {
          name: 'creditScore',
          type: 'number',
          min: 300,
          max: 850,
          admin: {
            condition: (data) => data.loanAccess?.isApproved,
          },
        },
      ],
    },

    // Documents
    {
      name: 'documents',
      type: 'array',
      fields: [
        {
          name: 'file',
          type: 'upload',
          relationTo: 'media',
          required: true,
        },
        {
          name: 'documentType',
          type: 'select',
          options: [
            { label: 'ID', value: 'id' },
            { label: 'Contract', value: 'contract' },
            { label: 'Other', value: 'other' },
          ],
        },
        {
          name: 'description',
          type: 'text',
        },
      ],
    },

    // Sensitive Fields
    {
      name: 'financialDetails',
      type: 'group',
      access: {
        read: ({ req }): boolean => {
          if (!req.user) return false
          return adminOnlyFieldAccess({ req })
        },
        update: ({ req }): boolean => {
          if (!req.user) return false
          return adminOnlyFieldAccess({ req })
        },
      } as Record<'read' | 'update', FieldAccess<any, any>>,
      fields: [
        // ... financial fields ...
      ],
    },

    // Regular Fields
    {
      name: 'personalInfo',
      type: 'group',
      access: {
        read: ({ req }): boolean => {
          if (!req.user) return false
          return employeeFieldAccess({ req })
        },
        update: ({ req }): boolean => {
          if (!req.user) return false
          return employeeFieldAccess({ req })
        },
      },
      fields: [
        // ... personal info fields ...
      ],
    },

    // Membership Tier
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
  ],

  // ===========================
  // 🪝 HOOKS
  // ===========================
  hooks: {
    beforeChange: [
      async ({ req, operation, data }) => {
        if (operation === 'create') {
          data.employeeUUID = data.employeeUUID || `EMP-${uuidv4()}`
          data.createdAt = new Date().toISOString()
          data.updatedAt = new Date().toISOString()
          // Ensure request user exists before checking role
          const userRole = req.user?.collection === 'employers' ? 'employer' : 'guest'

          if (userRole === 'employer') {
            const employer = await req.payload.findByID({
              collection: 'employers',
              id: req.user?.id ?? '',
            })
            if (employer?.companyUUID) {
              data.companyUUID = employer.companyUUID
            } else {
              throw new Error('Unable to associate employee with company')
            }
          }

          // Check for existing user before creating new one
          if (!data.userId) {
            const existingUser = await req.payload.find({
              collection: 'users',
              where: { email: { equals: data.email } },
            })
            if (existingUser.docs.length > 0 && existingUser.docs[0]) {
              data.userId = existingUser.docs[0].id
            } else {
              const newUser = await req.payload.create({
                collection: 'users',
                data: {
                  email: data.email,
                  name: `${data.firstName} ${data.lastName}`,
                  role: 'employee',
                  companyUUID: data.companyUUID,
                  mobileNumber: data.mobileNumber,
                  userId: data.employeeUUID,
                  authProvider: 'local',
                },
              })
              data.userId = newUser.id
            }
          }
          if (userRole === 'employer' && req.user?.id) {
            data.employerId = req.user.id
          }

          // Validate employee eligibility
          const eligibility = validatePayrollAdvance(data.employmentDuration, data.performanceScore)

          if (!eligibility.eligible) {
            throw new Error(eligibility.reason)
          }

          if (eligibility.restrictions) {
            data.advanceLimit = eligibility.restrictions.maxAdvancePercentage
          }

          // Handle social auth data
          if (data.authProvider === 'google' && !data.googleId) {
            throw new Error('Google ID is required for Google authentication')
          }
          if (data.authProvider === 'facebook' && !data.facebookId) {
            throw new Error('Facebook ID is required for Facebook authentication')
          }
        }
        data.updatedAt = new Date().toISOString()
        return data
      },
    ],
    afterChange: [
      async ({ doc, req, operation }) => {
        // Handle password generation and hashing after document is created
        if (
          operation === 'create' &&
          doc.authProvider !== 'google' &&
          doc.authProvider !== 'facebook'
        ) {
          const generatedPassword = crypto.randomBytes(8).toString('hex')
          const hashedPassword = await hash(generatedPassword, 10)

          await req.payload.update({
            collection: 'employees',
            id: doc.id,
            data: {
              password: hashedPassword,
              authProvider: 'local',
            },
          })

          // Send password email
          await sendPasswordEmail(doc.email, generatedPassword)
        }
      },
    ],
    afterLogin: [
      async ({ req, user }) => {
        try {
          await req.payload.update({
            collection: 'employees',
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
        console.log('Employee logged out successfully')
      },
    ],
  },
}

export default Employee
