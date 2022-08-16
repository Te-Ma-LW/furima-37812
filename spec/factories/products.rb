FactoryBot.define do
  factory :product do
    
    name                  { 'aaa' }
    description           { 'aaa' }
    category_id           { '2' }
    product_status_id     { '2' }
    prefecture_id         { '1' }
    scheduled_delivery_id { '1' }
    shipping_charge_id    { '1' }
    product_price_id      { '1111' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end
