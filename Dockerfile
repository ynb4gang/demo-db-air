FROM postgres:16

RUN apt-get update && apt-get install -y curl gzip \
    && curl -L -o /docker-entrypoint-initdb.d/demo.sql.gz https://edu.postgrespro.ru/demo-20250901-3m.sql.gz \
    && gunzip /docker-entrypoint-initdb.d/demo.sql.gz \
    && sed -i '/transaction_timeout/d' /docker-entrypoint-initdb.d/demo.sql \
    && sed -i '/DROP DATABASE/d' /docker-entrypoint-initdb.d/demo.sql \
    && sed -i '/CREATE DATABASE/d' /docker-entrypoint-initdb.d/demo.sql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
