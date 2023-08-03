# Dockerfile
## docker command
### docker image

    docker image ls
    docker image build --no-cache --tag IMAGE .

### docker container

    docker container ls
    docker container stop NAME

#### docker container run

    docker container run -it --rm --name NAME IMAGE

    --name NAME
        NAMEと名付けてコンテナを起動
    --rm
        コンテナ終了時に削除する
    -i
        stdinを開く
    -t
        擬似ttyを使用
    -t P:Q
        ホストのport Pをコンテナのport Qに割り当てる

### docker save & docker load

    docker save xxxxx -o xxxxx.tar
    docker load -i xxxxx.tar
