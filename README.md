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

| Column             | Type    | Options        |
| ------------------ | ------- | -------------- |
| nickname           | string  | null: false    |
| email              | string  | null: false    |
| encrypted_password | string  | null: false    |
| user_image         | string  |                |
| introduction       | text    |                |
| family_name        | string  | null: false    |
| first_name         | string  | null: false    |
| family_name_kana   | string  | null: false    |
| first_name_kana    | string  | null: false    |
| birth_day          | data    | null: false    |

### Association
- has_many :products dependent :destroy
- belongs_to :products dependent :destroy
- belongs_to :card dependent :destroy


## destination テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| user_id            | integer    | null: false, foreign_key: true |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    | 
| city               | string     | null: false                    |
| adress             | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     |                                |

### Association
- belongs_to :user


## category テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| ancestry      | string     |                   |

### Association
- has_many :products

## product テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| name            | integer    | null: false                    |
| price           | string     | null: false                    |
| description     | string     | null: false                    |
| status          | string     | null: false                    |
| size            | string     | null: false                    |
| shopping_cost   | string     | null: false                    |
| shopping_days   | string     | null: false                    | 
| prefecture_id   | string     | null: false                    |
| jidgment        | string     |                                |
| category_id     | string     |null: false, foreign_key: true  |
| brand_id        | integer    |null: false, foreign_key: true  |
| shopping_id     | integer    |null: false, foreign_key: true  |
| user_id         | integer    |null: false, foreign_key: true  |

### Association
- belongs_to :user dependent :destroy
- belongs_to :category dependent :destroy
- belongs_to :brand dependent :destroy
- has_many :images dependent :destroy

- belongs_to_active_hush :prefecture


## image テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| image         | string     | null: false                   |
| product_id    | integer    |null: false, foreign_key: true |

### Association
- belongs_to :product

## brand テーブル

| Column        | Type       | Options          |
| ------------- | ---------- | ---------------- |
| name          | string     | index: ture      |

### Association
- has_many :products