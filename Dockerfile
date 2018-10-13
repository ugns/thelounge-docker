FROM node:alpine

MAINTAINER Jeremy T. Bouse <Jeremy.Bouse@UnderGrid.net>

ARG THELOUNGE_VERSION=3.0.0-rc.3

ENV NODE_ENV production
ENV THELOUNGE_HOME "/var/opt/thelounge"
ENV PORT 9000

RUN apk upgrade --no-cache && \
    yarn global add thelounge@${THELOUNGE_VERSION} && \
    yarn cache clean --force

VOLUME "${THELOUNGE_HOME}"

EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["thelounge", "start"]
