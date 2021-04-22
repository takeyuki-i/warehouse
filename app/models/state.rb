class State < ApplicationRecord

  with_options presence: true do
    validates :quantity
    validates :unit_id
    validates :limit_id
    validates :alarm_id
    validates :storage_name
    validates :storage_address
  end

  with_options numericality: { other_than: 1 } do
    validates :unit_id
    validates :limit_id
    validates :alarm_id
  end

  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :limit
  belongs_to :alarm
  belongs_to :unit

  def self.search
  end

end