FROM node:23-alpine

RUN apk add --no-cache \
    # Chrome dependencies
    chromium\
    ttf-freefont \
    font-noto-emoji \
    && apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    font-wqy-zenhei

ENV DOCKER_CONTAINER=true
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

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
