import csrf from 'csrf';
import type { PayloadRequest } from 'payload';
import type { IncomingMessage, ServerResponse } from 'http';

const tokens = new csrf();

export const csrfMiddleware = (req: PayloadRequest & IncomingMessage, res: ServerResponse, next: () => void) => {
  // Skip CSRF for GET requests
  if (req.method === 'GET') {
    return next();
  }

  const token = req.headers[process.env.CSRF_TOKEN_NAME || 'x-csrf-token'] as string;

  if (!tokens.verify(process.env.CSRF_SECRET || '', token)) {
    res.statusCode = 403;
    res.end(JSON.stringify({ error: 'Invalid CSRF token' }));
    return;
  }

  next();
}; 