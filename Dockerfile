FROM node:14-alpine

RUN apk --no-cache add curl

RUN yarn global add --ignore-optional taskforce-connector && yarn cache clean

CMD taskforce -n "${TASKFORCE_CONNECTION}" --team "${TASKFORCE_TEAM}"

HEALTHCHECK --interval=30s --timeout=30s \
  --start-period=5s --retries=3 CMD curl -f http://localhost || exit 1

LABEL org.opencontainers.image.source="https://github.com/taskforcesh/taskforce-connector"
