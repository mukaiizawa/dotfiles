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

    --entrypoint CMD
        エントリーポイントをCMDにする。デバッグ時などに重宝する。
    --name NAME
        NAMEと名付けてコンテナを起動する。
    --rm
        コンテナ終了時に削除する。
    -i
        stdinを開く。
    -t
        擬似ttyを使用する。
    -t P:Q
        ホストのport Pをコンテナのport Qに割り当てる。

### docker save & docker load

    docker save xxxxx -o xxxxx.tar
    docker load -i xxxxx.tar
