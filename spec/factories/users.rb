FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "a1" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name           { '佐藤' }
    first_name            { '太郎' }
    last_name_kana      { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birth_day              { '1970-01-01' }
  end
end
