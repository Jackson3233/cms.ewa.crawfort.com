import { OAuth2Client } from 'google-auth-library'
import type { PayloadRequest } from 'payload'
import axios from 'axios'
import type { Employee, Employer, User } from '../payload-types'

// Types
export interface OAuthUserData {
  email: string
  name?: string
  picture?: string
  provider: 'google' | 'facebook' | 'local'
}

// Google OAuth Configuration
const googleClient = new OAuth2Client({
  clientId: process.env.GOOGLE_CLIENT_ID,
})

// Verify Google Token
export const verifyGoogleToken = async (token: string): Promise<OAuthUserData | null> => {
  try {
    const ticket = await googleClient.verifyIdToken({
      idToken: token,
      audience: process.env.GOOGLE_CLIENT_ID,
    })
    const payload = ticket.getPayload()

    if (!payload?.email) return null

    return {
      email: payload.email,
      name: payload.name,
      picture: payload.picture,
      provider: 'google',
    }
  } catch (error) {
    console.error('Google token verification failed:', error)
    return null
  }
}

// Facebook verification
export const verifyFacebookToken = async (token: string): Promise<OAuthUserData | null> => {
  try {
    // Verify token with Facebook
    const { data } = await axios.get(
      `https://graph.facebook.com/me?fields=email,name,picture&access_token=${token}`,
    )

    if (!data.email) return null

    return {
      email: data.email,
      name: data.name,
      picture: data.picture?.data?.url,
      provider: 'facebook',
    }
  } catch (error) {
    console.error('Facebook token verification failed:', error)
    return null
  }
}

// Generic OAuth Verification
export const verifyOAuthToken = async (
  provider: string,
  token: string,
): Promise<OAuthUserData | null> => {
  switch (provider) {
    case 'google':
      return verifyGoogleToken(token)
    case 'facebook':
      return verifyFacebookToken(token)
    default:
      return null
  }
}

// Collection-specific login handlers
export const handleEmployeeLogin = async (
  req: PayloadRequest,
  provider: string,
  token: string,
): Promise<Employee> => {
  const userData = await verifyOAuthToken(provider, token)
  if (!userData) throw new Error('Invalid OAuth token')

  const employeeResult = await req.payload.find({
    collection: 'employees',
    where: { email: { equals: userData.email } },
  })

  if (!employeeResult.docs.length) {
    throw new Error('No employee account found with this email')
  }
  const employee = employeeResult.docs[0]
  if (employee?.status !== 'active') {
    throw new Error('Account is not active')
  }

  return employee
}

export const handleEmployerLogin = async (
  req: PayloadRequest,
  provider: string,
  token: string,
): Promise<Employer> => {
  const userData = await verifyOAuthToken(provider, token)
  if (!userData) throw new Error('Invalid OAuth token')

  const employerResult = await req.payload.find({
    collection: 'employers',
    where: { email: { equals: userData.email } },
  })

  if (!employerResult.docs.length) {
    throw new Error('No employer account found with this email')
  }

  const employer = employerResult.docs[0]
  if (employer?.status !== 'active') {
    throw new Error('Account is not active')
  }

  return employer
}

export const handleUserLogin = async (
  req: PayloadRequest,
  provider: string,
  token: string,
): Promise<User> => {
  const userData = await verifyOAuthToken(provider, token)
  if (!userData) throw new Error('Invalid OAuth token')

  const userResult = await req.payload.find({
    collection: 'users',
    where: { email: { equals: userData.email } },
  })

  if (!userResult.docs.length) {
    throw new Error('No user account found with this email')
  }

  const user = userResult.docs[0]
  if (user?.status !== 'active') {
    throw new Error('Account is not active')
  }

  return user
}
