FROM node:13.11.0 as base

ENV APP_HOME=/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

FROM base as dev
COPY package.json $APP_HOME
COPY package-lock.json $APP_HOME

RUN npm install --only=production
RUN cp -R node_modules prod_modules
RUN npm install

FROM dev as test
COPY ./ $APP_HOME

FROM dev as build
COPY ./ $APP_HOME
RUN npm run build

FROM base as prod

COPY --from=dev $APP_HOME/prod_modules ./node_modules
COPY --from=build $APP_HOME/package.json ./package.json
COPY --from=build $APP_HOME/dist ./dist

CMD ["npm", "start"]
