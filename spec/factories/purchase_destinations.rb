FactoryBot.define do
  factory :purchase_destination do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678'}
    product { 1 }
    token { tok_b47b4c3de31d144756ee241b7bb6 }
  end
end
