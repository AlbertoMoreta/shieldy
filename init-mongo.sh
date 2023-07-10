#!/bin/bash
set -Eeuo pipefail

_js_escape() {
  printf '%s\n' "$1" | sed -e 's/[]\/$*.^[]/\\&/g'
}

if [ "$MONGO_SHIELDY_USERNAME" ] && [ "$MONGO_SHIELDY_PASSWORD" ]; then
  mongosh mongodb://0.0.0.0:27017/admin -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" <<-EOJS
    use $MONGO_INITDB_DATABASE;
    db.createUser({ 
      user: "$MONGO_SHIELDY_USERNAME", pwd: "$MONGO_SHIELDY_PASSWORD", roles: [{ role: "readWrite", db: "$MONGO_INITDB_DATABASE"}]
    });
EOJS
fi

