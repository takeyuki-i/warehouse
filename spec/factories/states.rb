FactoryBot.define do
  factory :state do
    quantity  { 1000 }
    unit_id    { 2 }
    limit_id   { 2 }
    limit_day  { 20210507 }
    storage_name { '倉庫A' }
    storage_address  { '東京都' }
    association :item
  end
end