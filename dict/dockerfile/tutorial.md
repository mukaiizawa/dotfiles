# Dockerfile
## docker command
### docker image
イメージの一覧を表示する。

    docker image ls

使われていないイメージを削除する。

    docker image prune

指定したイメージを削除する。

    docker image rm IMAGE

カレントディレクトリのDockerfileを用いてイメージをビルドする。

    docker image build --no-cache --tag IMAGE .

### docker container
コンテナの一覧を表示する。

    docker container ls

指定したコンテナを停止する。

    docker container stop NAME

コンテナを起動する。

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
    -v P:Q
        ホストのディレクトリPをコンテナのQにマウントする。

### docker save & docker load

    docker save xxxxx -o xxxxx.tar
    docker load -i xxxxx.tar
