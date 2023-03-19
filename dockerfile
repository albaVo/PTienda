# FROM node:16 as install
# LABEL stage=install

# ARG PROYECTO
# ARG DB_HOST
# ARG DB_NAME
# ARG DB_PORT
# ARG DB_USERNAME
# ARG DB_PASSWORD
# ARG NEST_PORT

# ENV PROYECTO=${PROYECTO}
# ENV DB_HOST=${DB_HOST}
# ENV DB_NAME=${DB_NAME}
# ENV DB_PORT=${DB_PORT}
# ENV DB_USERNAME=${DB_USERNAME}
# ENV DB_PASSWORD=${DB_PASSWORD}
# ENV NEST_PORT=${NEST_PORT}

# WORKDIR /app
# COPY  --chown=node:node ./api_nest/package.json .
# COPY --chown=node:node ./api_nest/yarn.lock .
# RUN yarn install --force

# COPY --chown=node:node ./api_nest .

# RUN yarn build
# ENV NODE_ENV production
# RUN yarn config set network-timeout 60000
# RUN yarn install --production=true && yarn cache clean --force
# # WORKDIR /app/dist
# # EXPOSE 3005

# FROM nginx:1.19.0-alpine as deploy
# COPY --from=install /app/dist/main.js /usr/share/nginx/html/index.js
# COPY --from=install /app/node_modules /usr/share/nginx/html/node_modules
# EXPOSE 80
# # #levantar nginx
# CMD [ "nginx", "-g", "daemon off;" ]
# # ENTRYPOINT ["node", "main.js"]




FROM node:18-alpine as build
LABEL stage=build

ARG DB_HOST
ARG DB_PORT
ARG DB_USER
ARG DB_NAME
ARG DB_PASS
ARG DB_SYNC
ARG NODE_ENV
ARG W_PORT

ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_USER=${DB_USER}
ENV DB_NAME=${DB_NAME}
ENV DB_PASS=${DB_PASS}
ENV DB_SYNC=${DB_SYNC}
ENV NODE_ENV=${NODE_ENV}
ENV W_PORT=${W_PORT}

WORKDIR /api
COPY  --chown=node:node ./api_nest/package.json .
COPY --chown=node:node ./api_nest/yarn.lock .
RUN yarn install --force

COPY --chown=node:node ./api_nest .

RUN apk add --no-cache git && \
  yarn global add @nestjs/cli && \
  yarn install --production --ignore-scripts --prefer-offline

RUN yarn build
ENV NODE_ENV production
RUN yarn config set network-timeout 60000
RUN yarn install --production=true && yarn cache clean --force
# WORKDIR /app/dist
# EXPOSE 3005

FROM nginx:1.19.0-alpine as deploy
COPY --from=build /api/dist/main.js /usr/share/nginx/html/index.js
COPY --from=build /api/node_modules /usr/share/nginx/html/node_modules
EXPOSE 80
# #levantar nginx
CMD [ "nginx", "-g", "daemon off;" ]
# ENTRYPOINT ["node", "main.js"]