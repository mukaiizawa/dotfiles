# Dockerfile
## docker command
### docker image

    docker image ls
    docker image build --no-cache --tag IMAGE .

### docker container

    docker container ls
    docker container run -it --rm --name NAME IMAGE
    docker container stop NAME

### docker save & docker load

    docker save xxxxx -o xxxxx.tar
    docker load -i xxxxx.tar
