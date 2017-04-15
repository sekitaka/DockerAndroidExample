# Dockerイメージのビルド
まずDockerイメージを作成します。

```
cd <プロジェクトディレクトリ>
docker build -t android docker/
```

# Androidアプリのビルド
Dockerコンテナ上でAndroidアプリをビルドします。
成功すれば、`app/build/outputs/apk`にapkファイルが生成されます。

```
cd <プロジェクトディレクトリ>
docker run --rm \
-v `pwd`:/app \
-v `pwd`/docker/share_by_container/android-sdk:/Android/sdk \
-v `pwd`/docker/share_by_container/dot_gradle:/root/.gradle \
-w /app -t android sh build.sh
```



# コンテナにログインして調査したい
うまくビルドできない場合などコンテナにログインして調査したくなると思います。
そんな時は以下のコマンドでコンテナに接続できます。
`--rm`オプションはログアウト時にコンテナを自動で削除するオプションです。

```
docker run --rm \
-v `pwd`:/app \
-v `pwd`/docker/share_by_container/android-sdk:/Android/sdk \
-v `pwd`/docker/share_by_container/dot_gradle:/root/.gradle \
-w /app -it android bash
```




