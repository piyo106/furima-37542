# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name_kanji  | string | null: false               |
| first_name_kanji   | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| description             | text       | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| shipping_charge_id      | integer    | null: false                    |
| prefectures_id          | integer    | null: false                    |
| scheduled_delivery_id   | integer    | null: false                    |

### Association

- belongs_to user
- has_one order

### ActiveHashを用いたAssociation

- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_charge
- belongs_to :prefectures
- belongs_to :scheduled_delivery

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| adderss         | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

### ActiveHashを用いたAssociation

- belongs_to :prefectures