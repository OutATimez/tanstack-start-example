# Build stage
FROM oven/bun:latest as build

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json bun.lock ./

# Install dependencies
RUN bun install --frozen-lockfile

# Copy source code
COPY . .

# Build the app
RUN bun --bun run build

# Serve stage
FROM oven/bun:latest

# Copy built assets from build stage
COPY --from=build /app/.output /app/.output

# Expose port (will be overridden by Render)
EXPOSE 3000

ENV PORT=3000

# Start the server
CMD ["node", "/app/.output/server/index.mjs"]