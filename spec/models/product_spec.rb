require 'rails_helper'
describe Product do
  describe '#create' do
    it "name,price,descriotion,status,shipping_cost,prefecture_id,shipping_daysが全て存在している" do
      product = build(:product)
      expect(product).to be_valid
    end
    it "nameがない場合は登録できないこと" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
    it "priceがない場合は登録できないこと" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    it "descriptionがない場合は登録できないこと" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end
    it "statusがない場合は登録できないこと" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
    it "shipping_costがない場合は登録できないこと" do
      product = build(:product, shipping_cost: "")
      product.valid?
      expect(product.errors[:shipping_cost]).to include("can't be blank")
    end
    it "prefecture_idがない場合は登録できないこと" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end
    it "shipping_daysがない場合は登録できないこと" do
      product = build(:product, shipping_days: "")
      product.valid?
      expect(product.errors[:shipping_days]).to include("can't be blank")
    end
  end
end
