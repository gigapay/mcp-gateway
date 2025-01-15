FROM node:23-alpine

RUN apk add --no-cache \
    # Chrome dependencies
    chromium-swiftshader \
    ttf-freefont \
    font-noto-emoji \
    && apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    font-wqy-zenhei

ENV DOCKER_CONTAINER=true \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1 \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
    PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 \
    PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH=/usr/bin/chromium-browser \
    CHROMIUM_FLAGS="--disable-software-rasterizer --disable-dev-shm-usage" \
    CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the application files (optional if you'd like to build/run an application)
COPY . .

# Command to keep the container running
CMD ["npm", "start"]
