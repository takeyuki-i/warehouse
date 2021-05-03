FactoryBot.define do
  factory :item do
    name   { 'TEST' }
    information  { Faker::String.random }
    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
