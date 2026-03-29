# Use fixed Node 20 version (stable build)
FROM node:20.11-alpine

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (clean & fast)
RUN npm ci --omit=dev

# Copy source code
COPY . .

# Set environment
ENV NODE_ENV=production

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "index.js"]