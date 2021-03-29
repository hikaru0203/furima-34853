#テーブル設計

## usersテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| nickname  | string     | null: false                      |
| email     | string     | unique: true                      |
| encrypted_password  | string     | null: false                        |
| last_name | string     | null: false                        |
| first_name| string     | null: false                        |
| birthday  | date       | null: false                        | 
| last_name_kana| string| | null: false                        |
| first_name_kana| string| null: false                        |

### Association

- has_many :items
- has_many :orders
- has_many :destinations


## itemsテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| price     | integer    | null: false                        |
| condition_id | integer    | null: false                     |
| name      | string     | null: false                        | 
| prefecture_id| integer    | null: false                     |
| cost_id   | integer    | null: false                        |
| ship_date_id | integer    | null: false                     |
| text      | text          | null: false                     |
| category  | string        | null: false                     |

- belongs_to :user dependent: :destroy
- belongs_to :destination
- has_many :comments



## ordersテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| user       | references | foreign_key: true                  |
| item       | references | foreign_key: true                  |

- belongs_to :item
- belongs_to :user

## destinationテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| user_id   | integer    | null: false                        |
| phone_number| string    | null: false                       |   
| address   | string     | null: false                        |
| city      | string     | null: false                        |
| zip_code  | string     | null: false                        |
| prefecture_id | integer    | null: false                    | 
| building  | string     |                                    |

- belongs_to :user
- belongs_to order
