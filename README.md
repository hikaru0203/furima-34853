#テーブル設計

## usersテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| nickname  | string     | null: false                        |
| email     | string     | unique: true  null: false          |
| encrypted_password  | string     | null: false              |
| last_name | string     | null: false                        |
| first_name| string     | null: false                        |
| birthday  | date       | null: false                        | 
| last_name_kana| string| | null: false                       |
| first_name_kana| string| null: false                        |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| price     | integer    | null: false                        |
| user_id   | integer    | foreign_key: true                  |
| condition_id | integer    | null: false                     |
| name      | string     | null: false                        | 
| prefecture_id| integer    | null: false                     |
| cost_id   | integer    | null: false                        |
| ship_date_id | integer    | null: false                     |
| text      | text          | null: false                     |
| category_id  | integer        | null: false                 |

- belongs_to :user dependent: :destroy
- has_many :comments
- has_one :order


## ordersテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| user       | references | foreign_key: true                  |
| item       | references | foreign_key: true                  |

- has_one :destination
- belongs_to :user
- belongs_to :item

## destinationテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| order_id  | integer    |  foreign_key: true                 |
| phone_number| string    | null: false                       |   
| address   | string     | null: false                        |
| city      | string     | null: false                        |
| zip_code  | string     | null: false                        |
| prefecture_id | integer    | null: false                    | 
| building  | string     |                                    |

- belongs_to order
