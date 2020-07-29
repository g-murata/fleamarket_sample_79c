FactoryBot.define do

  factory :user_address do
    address_last_name              {"阿部"}
    address_first_name             {"太朗"}
    address_last_name_kana         {"あべ"}
    address_first_name_kana        {"たろう"}
    zip_code                       {"7777777"}
    prefecture_id                  {"13"}
    city                           {"千葉市"}
    street                         {"千葉町0-0-0"}
    building_name                  {"千葉マンション000号"}
    phone_number                   {"000-000-0000"}
    user
  end

end