# Use Node.js v20.18.3
FROM node:20.18.3

# Set working directory
WORKDIR /app

# Copy everything to container
COPY . .

# Install dependencies
RUN npm install

# Build the app (production)
RUN npm run build

# Output build folder
CMD ["ls", "-l", "dist"]

# docker build -t react-builder .
# docker create --name temp-react-builder react-builder
# docker cp temp-react-builder:/app/dist ./dist   # or use /app/build if using CRA
# docker rm temp-react-builder
