# Docker for PrimeAI node

Docker to facilitate the creation and operation of a primeai node.

----
## Basic commands

### Create image
Necessary to be in the same directory as the Dockerfile file

```docker build -t primeai-node .```

### Create container
Create a container named primeai-node with volume to store the data downloaded from the node.

```docker run -it -v primeai-node:/data --name primeai-node primeai-node```

### List volumes
Allows to know which volumes are created in the system.

```docker volume ls```

### List containers
Indicates the containers created in the system

```docker container ps```

### Know the ip of the container

```docker inspect <id_container or name_container>```

### Entering a container
During the execution of a container, it is possible to enter it from another terminal.

```docker exec -it <container_id_or name_container> /bin/bash```

### Reopen a container
When a container is closed and you want to continue where it was.

```docker start <container_id>```

### Delete containers and images

```docker system purge --all```
