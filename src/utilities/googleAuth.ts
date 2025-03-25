import { OAuth2Client } from 'google-auth-library'

const googleClient = new OAuth2Client(
  process.env.GOOGLE_CLIENT_ID,
  process.env.GOOGLE_CLIENT_SECRET,
  process.env.GOOGLE_REDIRECT_URI,
)

/**
 * Verifies a Google ID token and extracts user information.
 */
export const verifyGoogleToken = async (token: string) => {
  if (!token) throw new Error('No token provided')

  try {
    const ticket = await googleClient.verifyIdToken({
      idToken: token,
      audience: process.env.GOOGLE_CLIENT_ID, // Google Client ID
    })

    const payload = ticket.getPayload()

    if (!payload) throw new Error('No payload from Google token')

    return {
      googleId: payload.sub, // Google's unique identifier
      email: payload.email,
      name: payload.name,
      picture: payload.picture,
    }
  } catch (error: unknown) {
    if (error instanceof Error) {
      console.error('Google token verification error:', error.message)
    }
    throw new Error('Invalid Google token')
  }
}
