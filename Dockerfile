FROM node:20-slim

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (use npm install instead of npm ci)
RUN npm install --production=false

# Copy all source files
COPY . .

# Build TypeScript
RUN npm run build

# Set environment
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Start server
CMD ["node", "build/index.js", "--transport", "http", "--port", "3000"]
