FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    name                  {'伊藤'}
    address               {'東京都'}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end