#!/usr/bin/env sh

git checkout main

GEMFILE_LOCK_BEFORE_PULL=$(git rev-parse HEAD:Gemfile.lock)
YARN_LOCK_BEFORE_PULL=$(git rev-parse HEAD:yarn.lock)
SCHEMA_BEFORE_PULL=$(git rev-parse HEAD:db/structure.sql)

git pull origin main

GEMFILE_LOCK_AFTER_PULL=$(git rev-parse HEAD:Gemfile.lock)
YARN_LOCK_AFTER_PULL=$(git rev-parse HEAD:yarn.lock)
SCHEMA_AFTER_PULL=$(git rev-parse HEAD:db/structure.sql)

if [[ "$GEMFILE_LOCK_BEFORE_PULL" != "$GEMFILE_LOCK_AFTER_PULL" ]]; then
  echo "Running bundler"
  docker-compose run --rm app bundle
fi

if [[ "$YARN_LOCK_BEFORE_PULL" != "$YARN_LOCK_AFTER_PULL" ]]; then
  echo "Yarn installing"
  docker-compose run --rm app yarn
fi

if [[ "$SCHEMA_BEFORE_PULL" != "$SCHEMA_AFTER_PULL" ]]; then
  docker-compose run --rm app bin/rake db:migrate
  docker-compose run --rm app bin/rake db:migrate RAILS_ENV=test
fi
