FactoryBot.define do
  factory :item do
    name             {"名前"}
    text             {"説明"}
    condition_id     {1}
    category_id      {1}
    prefecture_id    {13}
    ship_date_id     {1}
    price            {9999}
    cost_id          {1}
    association :user
  end
end
