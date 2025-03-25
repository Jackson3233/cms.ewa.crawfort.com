import nodemailer from 'nodemailer'

export async function sendPasswordEmail(email: string, password: string): Promise<void> {
  console.log(`[📩] Sending email via SMTP2GO SMTP to: ${email}`)

  const transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST || 'mail.smtp2go.com',
    port: Number(process.env.SMTP_PORT) || 587,
    secure: process.env.SMTP_SECURE === 'true', // ✅ Use TLS (false) or SSL (true)
    auth: {
      user: process.env.SMTP_USER, // ✅ Your SMTP2GO email user
      pass: process.env.SMTP_PASS, // ✅ Your SMTP2GO password
    },
  })

  const mailOptions = {
    from: `"${process.env.SMTP_FROM_NAME || 'Crawfort'}" <${process.env.SMTP_FROM_EMAIL}>`,
    to: email,
    subject: 'Your Account Credentials',
    html: `
      <h1>Welcome to Our Platform</h1>
      <p>Your account has been created. Here are your login credentials:</p>
      <p><strong>Email:</strong> ${email}</p>
      <p><strong>Temporary Password:</strong> ${password}</p>
      <p>Please login and change your password immediately.</p>
      <p>If you didn't request this account, please contact support.</p>
    `,
  }

  try {
    const info = await transporter.sendMail(mailOptions)
    console.log(`✅ Email sent successfully to ${email}: ${info.messageId}`)
  } catch (error) {
    console.error(`❌ Email failed:`, error)
  }
}
