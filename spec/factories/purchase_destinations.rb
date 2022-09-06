FactoryBot.define do
  factory :purchase_destination do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678'}
    product_id { 1 }
    token { 1 }
  end
end
