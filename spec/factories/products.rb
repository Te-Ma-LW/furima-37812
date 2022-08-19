FactoryBot.define do
  factory :product do
    name                  { 'aaa' }
    description           { 'aaa' }
    category_id           { '1' }
    status_id             { '1' }
    prefecture_id         { '1' }
    shopping_days_id      { '1' }
    shipping_charge_id    { '1' }
    price                 { '1111' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
