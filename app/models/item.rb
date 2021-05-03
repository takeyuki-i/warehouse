class Item < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :states

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :limit

end