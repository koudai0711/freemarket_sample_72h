FactoryBot.define do

  factory :user do
    nickname              {"ばしくん"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"石橋"}
    first_name            {"遼大"}
    last_name_kana        {"イシバシ"}
    first_name_kana       {"リョウダイ"}
    birth_day             {"1996-09-13"}
  end

end