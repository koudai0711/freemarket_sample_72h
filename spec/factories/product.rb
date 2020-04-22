FactoryBot.define do

  factory :product do
    name            {"abe"}
    price           {"100"}
    description     {"neko"}
    status          {"neko"}
    shipping_cost   {"100"}
    prefecture_id   {"1"}
    shipping_days   {"1"}
    size            {"XS"}
  end
end