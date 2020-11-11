(イメージを作成)
$ docker-compose build

(nuxt フレームワーク作成 プロジェクト名 node_nuxt)
$ docker-compose run --rm web yarn create nuxt-app node_nuxt

(ディレクトリ整理、通常ファイルと隠しファイル、同じものは移動しない)
$ mv -n node_nuxt/* . && \
mv -n node_nuxt/.[^\.]* .

(残っているファイル、中身を確認してディレクトリごと削除)
$ rm -r node_nuxt

(web app 起動)
$ docker-compose up

(web ブラウザで localhost:3000 で確認)

(コンテナの中に入って作業したいとき、もう一つコンソールを開いて)
$ docker-compose exec web /bin/bash

(コンテナの中でライブラリ追加 Commander の場合)
# yarn add commander

(コンテナ終了)
# exit

(コンテナの外からモジュールを追加したいとき Moment の場合)
$ docker-compose exec web yarn add moment

(次回からの実行)
$ docker-compose up
