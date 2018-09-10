#!/bin/sh
set -ea

_stopEggApp() {
  echo "Stopping eggjs app"
  # kill -SIGINT "$eggappPID"
  # wait "$eggappPID"
}

# trap _stopEggApp SIGTERM SIGINT

cd /usr/src/eggapp

APP_NAME=${APP_NAME:-egg-app}
# DATABASE_HOST=${MONGO_HOST:-mongodb}
# DATABASE_PORT=${MONGO_PORT:-27017}
# DATABASE_NAME=${MONGO_DB:-strapi}

# if [ ! -d "$APP_NAME/node_modules" ]
# then
npm i --registry=https://registry.npm.taobao.org --prefix ./$APP_NAME
# fi

cd $APP_NAME
npm start

# eggappPID=$!
# wait "$eggappPID"
