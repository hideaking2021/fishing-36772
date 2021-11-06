# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| email       | string | null: false |
| password    | string | null: false |
| name        | string | null: false |
| rod         | text   | null: false |
| reel        | text   | null: false |
| feed        | text   | null: false |

### Association

- has_many :fishings
- has_many :comments
- has_many :likes

## fishings
| Column      | Type            | Options                        |
| ----------- | ----------------| -------------------------------|
| title       | string          | null: false                    |
| catch_copy  | text            | null: false                    |
| concept     | text            | null: false                    |
| image       | ActiveStorage   |                                |
| user        | references      | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :likes
- belongs_to :user

## comments
| Column      | Type            | Options     |
| ----------- | ----------------| ----------- |
| text        | text            | null: false |
| user        | references      |             |
| fishing     | references      |             |

### Association

- belongs_to :user
- belongs_to :fishing

## likes

| Column      | Type            | Options                      |
| ----------- | ----------------| -----------------------------|
| user        | references      | foreign_key: true            |
| fishing     | references      | foreign_key: true            |

### Association

- belongs_to :user
- belongs_to :fishing


[![Image from Gyazo](https://i.gyazo.com/c0ad845c0b87c3e7deda2eab0262a167.jpg)](https://gyazo.com/c0ad845c0b87c3e7deda2eab0262a167)
ユーザー新規路登録した後、マイページにアクセスすると新規投稿ボタンから、画像投稿、釣れた場所、使用した餌を選択して、釣果の魚を投稿できるようにしました。釣った魚を手軽に投稿でき、ユーザー、ログイン者においてはコメント投稿、いいねボタンを利用できるようにしました。投稿した時に、投稿した日付、時間を表示することで、いつ投稿したのか分かるようにしました。

[![Image from Gyazo](https://i.gyazo.com/96a46a71490fac12fdf78cdf43323a91.jpg)](https://gyazo.com/96a46a71490fac12fdf78cdf43323a91)

釣果画像を9枚投稿した後、次の釣果画像を投稿すると、次の画面に遷移できるように、ページに移行できるようにしています。画面のスクロールの負担を少なくするためにページ遷移をすることで閲覧しやすくしています。

[![Image from Gyazo](https://i.gyazo.com/0ef9a20253ab9f8c80f0f673df0d76b3.jpg)](https://gyazo.com/0ef9a20253ab9f8c80f0f673df0d76b3)

釣果の魚を検索したい場合、魚を名前で検索し、目的の魚を検索することで探しやすくしました。検索結果で、閲覧したい魚を検索することで、一つの魚にまとめることが可能です。


[![Image from Gyazo](https://i.gyazo.com/22ca44aeea03f2bd86746da5f2ccdcd1.jpg)](https://gyazo.com/22ca44aeea03f2bd86746da5f2ccdcd1)

ログインユーザー、ユーザー以外のログイン者は、いいねボタンを選択するといいね投稿を可能にしました。も一度押すことでいいね機能を解除することも可能です。１ユーザーにつき１いいねが可能です。

[![Image from Gyazo](https://i.gyazo.com/6cfdf497fed3ce36bf99fceefec4155a.jpg)](https://gyazo.com/6cfdf497fed3ce36bf99fceefec4155a)

改行して、コメント投稿を可能にすることで、レシピを入力可能にしました。ログインユーザー、ログイン者がコメント投稿可能として、釣果感想、魚料理の投稿を可能にしました。

