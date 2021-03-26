#テーブル設計

## usersテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| nickname  | string     | unique: true                       |
| email     | string     | null: false                        |
| encrypted_password  | string     | null: false                        |
| last_name | string     | null: false                        |
| first_name| string     | null: false                        |
| birthday  | date       | null: false                        | 

### Association

- has_many :items
- has_many :comments

## itemsテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| category  | integer    | null: false                        |
| shipping  | integer    | null: false                        |
| brand_id  | string     | null: false                        |
| price     | integer    | null: false                        |
| condition | integer    | null: false                        |
| name      | string     | null: false                        | 
| prefecture| integer    | null: false                        |
| cost      | integer    | null: false                        |
| ship_date | integer    | null: false                        |

- belongs_to :user dependent: :destroy
- has_many :comments



## brandテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| name       |  string    | null: false          　　　　　　　  |

- has-many: :items

## categoryテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| name       | string     | null: false                        |

- has_many: :items


## ordersテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| buyer_id   | references | null: false                        |
| item_id    | references | null: false                        |

## destinationテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| user_id   | integer    | null: false                        |
| phone_number| integer    | null: false                      |
| address   | string     | null: false                        |
| city      | integer    | null: false                        |
| zip_code  | integer    | null: false                        |
| prefecture| string     | null: false                        | 
| family_name| integer    | null: false                       |
| first_name| integer    | null: false                        |
| family_name_kana | integer    | null: false                 |
| first_name_kana  | integer    |null: false                  |