#テーブル設計

##　usersテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| nickname  | string     | null: false                        |
| email     | string     | null: false                        |
| password  | string     | null: false                        |
| last_name | string     | null: false                        |
| first_name| string     | null: false                        |
| birthday  | date       | null: false                        | 

### Association

- has_many :items
- has_many :comments

## itemsテーブル

| Column    | Type       | Options                            |
| --------  | ---------- | ---------------------------------- |
| category  | string     | null: false                        |
| shipping  | string     | null: false                        |
| brand_id  | string     | null: false                        |
| price     | string     | null: false                        |
| condition | string     | null: false                        |
| name      | string     | null: false                        | 
| brand_id  | string     | null: false                        |
| prefecture| string     | null: false                        |
| cost      | string     | null: false                        |
| ship_date | string     | null: false                        |

- belongs_to :user dependent: :destroy
- has_many :comments

## cardテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| user_id    | string     | null: false                        |
| customer_id| string     | null: false                        |
| card_id    | string     | null: false                        |

- belongs_to :user

## commentsテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| user_id    | string     | null: false                        |
| item_id    | string     | null: false                        |
| text       | text       | null: false                        |

- belongs_to :items

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

## imagesテーブル

| Column     | Type       | Options                            |
| --------   | ---------- | ---------------------------------- |
| images     | string     | null: false                        |
| product_id | string     | null: false                        |

- belongs_to: :items



