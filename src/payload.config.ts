import sharp from 'sharp'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import { postgresAdapter } from '@payloadcms/db-postgres'
import { s3Storage } from '@payloadcms/storage-s3'
import { nodemailerAdapter } from '@payloadcms/email-nodemailer' // ✅ Use Nodemailer for SMTP

// Import collections
import { Categories } from './collections/Categories'
import { Media } from './collections/Media'
import { Pages } from './collections/Pages'
import { Posts } from './collections/Posts'
import Users from './collections/Core/Users'
import Employer from './collections/Core/Employer'
import Employee from './collections/Core/Employee'
import { PayrollAdvances } from './collections/payroll/PayrollAdvances'
import { PayrollRepayments } from './collections/payroll/PayrollRepayments'
import { Payrolls } from './collections/payroll/Payrolls'
import { PayrollTransactions } from './collections/financial/Payroll_Transactions'
import { FactoringCalculations } from './collections/calculations/FactoringCalculations'
import { FactoringRepayments } from './collections/calculations/FactoringRepayment'
import { PayrollFactoring } from './collections/calculations/payroll_factoring'

import { Footer } from './Footer/config'
import { Header } from './Header/config'
import { plugins } from './plugins'
import { defaultLexical } from '@/fields/defaultLexical'

const filename = fileURLToPath(import.meta.url)
const _dirname = path.dirname(filename) // ✅ Prefixed with `_` to avoid ESLint warning

// Ensure required environment variables are set
if (!process.env.DATABASE_URI) {
  throw new Error('DATABASE_URI is not set in environment variables.')
}

if (
  !process.env.S3_BUCKET_NAME ||
  !process.env.S3_ACCESS_KEY_ID ||
  !process.env.S3_SECRET_ACCESS_KEY
) {
  throw new Error('S3 storage is missing required environment variables.')
}

// ✅ Configure PayloadCMS Email to Use SMTP2GO's Native SMTP
export default buildConfig({
  admin: {
    user: Users.slug,
  },

  serverURL: process.env.PAYLOAD_SERVER_URL || 'https://cms.ewa.crawfort.com',

  collections: [
    Pages,
    Posts,
    Media,
    Categories,
    Users,
    Employer,
    Employee,
    PayrollAdvances,
    PayrollRepayments,
    Payrolls,
    PayrollTransactions,
    FactoringCalculations,
    FactoringRepayments,
    PayrollFactoring,
  ],

  cors: [
    'https://cms.ewa.crawfort.com',
    'https://ewa.crawfort.com',
    'https://crawfortph.pages.dev',
    'https://cloud-86dc1c.managed-vps.net', // ✅ Added VPS domain
  ],
  csrf: [
    'https://cms.ewa.crawfort.com',
    'https://ewa.crawfort.com',
    'https://crawfortph.pages.dev',
    'https://cloud-86dc1c.managed-vps.net', // ✅ Added VPS domain
  ],

  globals: [Header, Footer],

  plugins: [
    ...plugins,
    s3Storage({
      collections: {
        media: { prefix: 'media' },
      },
      bucket: process.env.S3_BUCKET_NAME,
      config: {
        forcePathStyle: true,
        credentials: {
          accessKeyId: process.env.S3_ACCESS_KEY_ID,
          secretAccessKey: process.env.S3_SECRET_ACCESS_KEY,
        },
        region: process.env.S3_REGION,
      },
    }),
  ],

  // ✅ Use Native SMTP2GO SMTP Configuration (No API-based Email Sending)
  email: nodemailerAdapter({
    defaultFromAddress: process.env.SMTP_FROM_EMAIL || 'no-reply@ewa.crawfort.com',
    defaultFromName: process.env.SMTP_FROM_NAME || 'Crawfort',
    transportOptions: {
      host: process.env.SMTP_HOST || 'mail.smtp2go.com',
      port: Number(process.env.SMTP_PORT) || 587, // Use 2525, 587 (TLS), or 465 (SSL)
      secure: process.env.SMTP_SECURE === 'true', // ✅ Enable SSL/TLS if needed
      auth: {
        user: process.env.SMTP_USER, // Your SMTP2GO username
        pass: process.env.SMTP_PASS, // Your SMTP2GO password or API key
      },
    },
  }),

  editor: defaultLexical,

  db: postgresAdapter({
    pool: { connectionString: process.env.DATABASE_URI },
    push: process.env.NODE_ENV === 'development',
  }),

  secret: process.env.PAYLOAD_SECRET,
  sharp,
})
