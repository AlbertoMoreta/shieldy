#!/bin/sh

export MONGO=mongodb://${MONGO_SHIELDY_USERNAME}:${MONGO_SHIELDY_PASSWORD}@mongo:27017/${MONGO_INITDB_DATABASE}

yarn distribute

