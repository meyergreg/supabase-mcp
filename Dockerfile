FROM node:20-slim

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
RUN pnpm install

# Build
RUN pnpm build

# Debug: list built files to see structure
RUN echo "=== Build structure ===" && find . -name "index.js" -path "*/build/*" || echo "No build found"

# Environment
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Auto-detect the correct path
CMD sh -c 'ENTRY=$(find . -name "index.js" -path "*/build/*" -type f | head -1) && echo "Starting: $ENTRY" && node "$ENTRY" --transport http --port 3000'
