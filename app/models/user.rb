class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :name
    validates :address
    validates :password, format: { with: /[a-zA-Z]{1,}+[0-9]{1,}/ }
  end

  has_many :items
  has_many :orders  

end