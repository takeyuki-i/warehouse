# テーブル設計

## items テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |
| user             | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- has_many :states
- has_many :sites

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| address            | string | null: false              |

### Association

- has_many :items

## states テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| quantity        | string     | null: false                     |
| unit_id         | integer    | null: false                     |
| limit_id        | integer    | null: false                     |
| limit_id        | integer    | null: false                     |
| limit_day       | datetime   | null: false                     |
| alarm_id        | integer    | null: false                     |
| alarm_day       | datetime   | null: false                     |
| storage_name    | string     | null: false                     |
| storage_address | string     | null: false                     |
| item            | references | null: false , foreign_key: true |
| site            | references | null: false , foreign_key: true |

### Association

- belongs_to :item

## sites テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| name       | string     | null: false                     |
| site_state | integer    | null: false                     |
| price      | integer    | null: false                     |
| fee        | integer    | null: false                     |
| item       | references | null: false , foreign_key: true |

### Association

- belongs_to :item