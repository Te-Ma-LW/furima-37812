# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| user_password      | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |

### Association
- has_many :products
- belongs_to :purchase 




## destination テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| user               | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    | 
| city               | string     | null: false                    |
| adress             | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association
- belongs_to :purchase 


## products テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | string     | null: false                    |
| status_id           | string     | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shopping_days_id    | integer    | null: false                    | 
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase 

- belongs_to_active_hush :prefecture


# Purchase テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| user_id           | references | null: false, foreign_key: true |
| products_id       | integer    | null: false                    |
| destination_id    | integer    | null: false                    |
| amount            | integer    | null: false                    |

### Association
- belongs_to :destination
- belongs_to :user 
- belongs_to :product 


