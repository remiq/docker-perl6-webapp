# https://registry.hub.docker.com/_/rakudo-star/
# + Postgres SO
FROM rakudo-star:2015.03
RUN apt-get update -qq
RUN apt-get install -y libpq-dev
EXPOSE 3000
VOLUME ["/app/web"]
WORKDIR /app/web

