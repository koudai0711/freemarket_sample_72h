require 'rails_helper'
describe Card do
  describe '#create' do
    it "user_idがない場合は登録できないこと" do
      card = Card.new(user_id: "", customer_id: "cus_e8187d7de4d3e3680b1b6bf89ed6", card_id: "car_4b48167a278a435f2805b887814e")
      card.valid?
      expect(card.errors[:user])
    end
    it "customer_idがない場合は登録できないこと" do
      card = Card.new(user_id: 1, customer_id: "", card_id: "car_4b48167a278a435f2805b887814e")
      card.valid?
      expect(card.errors[:customer_id])
    end
    it "card_idがない場合は登録できないこと" do
      card = Card.new(user_id: 1, customer_id: "cus_e8187d7de4d3e3680b1b6bf89ed6", card_id: "")
      card.valid?
      expect(card.errors[:card_id])
    end
  end
end