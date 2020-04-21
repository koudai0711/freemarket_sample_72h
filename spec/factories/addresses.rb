FactoryBot.define do

  factory :address do
    
    address_last_name       {"石橋"}
    address_first_name      {"遼大"}
    address_last_name_kana  {"イシバシ"}
    address_first_name_kana {"リョウダイ"}
    postal_code             {"111-1111"}
    prefecture_id           {"13"}
    city                    {"ばしばし"}
    house_number            {"1-1-1"}
    building_name           {"ラフィネ小石川"}
    phone_number            {"00-0000-0000"}
  end

end