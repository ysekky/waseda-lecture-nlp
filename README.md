# 第12回 自然言語処理の基礎

## 環境構築

前回までの環境に加えて以下のものが必要になります

- mecab
- mecab-ipadic-neologd
- natto (MeCabのPython3用ライブラリ)
- gemsim (言語モデルを扱うライブラリ)


## Dockerでの環境構築

下記コマンドでイメージを作成し、Jupyterが立ち上がる
`/path/to/directory/` は任意のディレクトリを設定

```
$ git clone git@github.com:ysekky/waseda-lecture-nlp.git
$ cd waseda-lecture-nlp
$ docker build -t waseda-gunosy/nlp .
$ docker run -p 8888:8888 waseda-gunosy/nlp
```

- `localhost:8888` でJupyter Notebookが立ち上がります
- volumeのマウントなどは各自でやってください

## 動作確認

Jupyterで下記スクリプトが動作すればOK

```python
# MeCabのインポート
from natto import MeCab

# MeCabの動作確認
m = MeCab()
print(m.parse("大谷翔平"))

# 大谷	名詞,固有名詞,人名,姓,*,*,大谷,オオヤ,オーヤ
# 翔	名詞,固有名詞,人名,名,*,*,翔,ショウ,ショー
# 平	名詞,固有名詞,地域,一般,*,*,平,タイラ,タイラ
# EOS

# neologdの動作確認
m_neologd = MeCab('-d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd')
print(m_neologd.parse("大谷翔平"))

# 大谷翔平	名詞,固有名詞,人名,一般,*,*,大谷翔平,オオタニショウヘイ,オオタニショーヘイ
# EOS
```

