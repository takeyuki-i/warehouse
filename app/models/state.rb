class State < ApplicationRecord

  with_options presence: true do
    validates :quantity , format: { with: [0-9] , message: "数字以外は入力できません。" }
    validates :unit_id
    validates :limit_id
    validates :storage_name , format: { with:  /\A[a-zA-Zａ-ｚＡ-ｚぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :storage_address
  end

  with_options numericality: { other_than: 1 } do
    validates :unit_id
    validates :limit_id
  end

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validates :quantity, numericality: { less_than_or_equal_to: 9_999_999 }

  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :limit
  belongs_to :unit

end