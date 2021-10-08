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