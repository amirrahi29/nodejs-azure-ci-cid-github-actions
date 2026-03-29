# Use Node 20 (stable LTS)
FROM node:20.11-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies (only production)
RUN npm ci --omit=dev

# Copy remaining app code
COPY . .

# Set environment
ENV NODE_ENV=production

# Expose app port
EXPOSE 3000

# Start application
CMD ["node", "index.js"]