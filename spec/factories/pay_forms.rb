FactoryBot.define do
  factory :pay_form do
    zip_code        {"321-0567"}
    city            {"京都市"}
    address         {"番地"}
    building        {"ビル"}
    phone_number    {"08034641345"}
    prefecture_id   {1}  
    token {"tok_abcdefghijk00000000000000000"}
  end
end
