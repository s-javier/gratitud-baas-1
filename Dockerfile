FROM alpine:latest

ARG PB_VERSION=0.22.21

RUN apk add --no-cache \
    unzip \
    ca-certificates

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

WORKDIR /pb
# COPY pb_hooks ./pb_hooks
# COPY pb_migrations ./pb_migrations

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]

# En container: crear variable PORT con valor 8080
# Crear volumen y configurar mount path /pb/pb_data
