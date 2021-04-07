FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'s000000'}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birth_day             {"1990-03-27"}
  end
end