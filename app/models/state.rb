class State < ApplicationRecord

  with_options presence: true do
    validates :quantity
    validates :limit_id
    validates :alarm_id
    validates :storage_name
    validates :storage_address
  end

  with_options numericality: { other_than: 1 } do
    validates :limit_id
    validates :alarm_id
  end

  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :limit
  belongs_to :alarm

end