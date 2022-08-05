FactoryBot.define do
  factory :user do
    nickname              { 'テスト用ユーザー' }
    email                 { Faker::Internet.free_email }
    password =            'test1234'
    password              { password }
    password_confirmation { password }
    last_name           { '佐藤' }
    first_name            { '太郎' }
    last_name_kana      { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birth_day              { '1970-01-01' }
  end
end
