# OOPExercise

オブジェクト指向エクササイズの練習問題的なものです

9つのルールに従ってリファクタしてください

## Rules

1. 1つのメソッドにつきインデントは1段階まで
2. else句を使用しないこと
3. 全てのプリミティブ型と文字列型をラップする
4. 1行につきドットは1つまでにする
5. 名前を省略しない
6. 全てのエンティティを小さくする
7. 1つのクラスに付きインスタンス変数は2つまでにする
8. ファーストクラスコレクションを使用する
9. Getter, Setter, プロパティを使用しない


### Local Rules

1. `attr_accessor`, `attr_writer`, `attr_reader` を使用しない
1. 全ての標準ライブラリのクラスインスタンスをラップする
1. 一つの module に定数(クラス, モジュールも含む)は10個まで

## Usage

Ruby version 2.6.2

### Gem 
```sh
$ bundle install --path vendor/bundle
```

### Run

```sh
$ bundle exec lib/main.rb
```

#### example input
```
500 COKE
100 COKE
500 DIET_COKE
100 TEA
```

#### example output
```
コーラを購入しました
おつりは400円です
コーラを購入しました
おつりは0円です
ダイエットコーラを購入しました
おつりは400円です
お茶を購入しました
おつりは0円です
```


### Test

```sh
$ bundle exec rspec spec/
```
