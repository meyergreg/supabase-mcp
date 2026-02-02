FROM node:20-slim

WORKDIR /app

# Copie package files
COPY package*.json ./

# Install dependencies
RUN npm ci --production=false

# Copy source
COPY . .

# Build TypeScript
RUN npm run build

# Expose port
ENV PORT=3000
EXPOSE 3000

# Start command
CMD ["node", "build/index.js", "--transport", "http", "--port", "3000"]
