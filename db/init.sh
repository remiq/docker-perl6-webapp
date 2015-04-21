#!/bin/sh

psql --host=$POSTGRES_HOST --username=$POSTGRES_USER --dbname=$POSTGRES_DATABASE < /app/db/init.sql
