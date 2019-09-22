# My development infrastructure

These scripts will setup a keycloak and a wildfly instance backed by a postgresql database.

# Alias creation

Create an alias to include all docker-compose.*.yml files:

```
for yml in ./docker-compose.*.yml; do yml_files="$yml_files -f $yml"; echo $yml_files; done; alias all-containers="docker-compose -f docker-compose.yml $yml_files"
```

Show new alias:

```
alias all-containers
```

or the full command for the record:

```
docker-compose -f docker-compose.yml -f docker-compose.setup.keycloak.yml -f docker-compose.setup.wildfly.yml -f docker-compose.setup.wildfly-deployment.yml
```

# Run instructions

Start all containers:

```
all-containers up -d --force-recreate
```

Show state for each container:

```
all-containers ps
```

Find unexpected container exits:

```
all-containers ps | grep 'Exit ' | grep -v 'Exit 0'
```

Follow logs for each container:

```
all-containers logs --follow
```

Show last logs for each container and follow:

```
all-containers logs --follow --tail 2
```

# Incremental setup of main containers

## Start main containers only

```
docker-compose up -d --force-recreate
```

or alternatively the explicit command:

```
all-containers up -d --force-recreate postgres keycloak wildfly
```

## Start one container after another

To start one container only you need to ignore dependencies to prevent a restart of finished setup containers:

```
all-containers up -d --force-recreate --no-deps keycloak-setup
all-containers up -d --force-recreate --no-deps wildfly-setup
all-containers up -d --force-recreate --no-deps ...-setup
```
