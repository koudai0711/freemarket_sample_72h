require 'rails_helper'
describe Address do
  describe '#create' do
    it ":address_last_name, :address_first_name, :address_last_name_kana, :address_first_name_kana, :postal_code, :prefecture_id, :city, :house_number, building_name, phone_numberが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "address_last_nameがない場合は登録できないこと" do
      address = build(:address, address_last_name: "")
      address.valid?
      expect(address.errors[:address_last_name]).to include("is invalid")
    end

    it "address_first_nameがない場合は登録できないこと" do
      address = build(:address, address_first_name: "")
      address.valid?
      expect(address.errors[:address_first_name]).to include("is invalid")
    end

    it "address_last_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_last_name_kana: "")
      address.valid?
      expect(address.errors[:address_last_name_kana]).to include("is invalid")
    end

    it "address_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_first_name_kana: "")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("is invalid")
    end

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "house_numberがない場合は登録できないこと" do
      address = build(:address, house_number: "")
      address.valid?
      expect(address.errors[:house_number]).to include("can't be blank")
    end

    it "building_nameがない場合でも登録できること" do
      address = build(:address, building_name: "")
      expect(address).to be_valid
    end

    it "phone_numberがない場合でも登録できること" do
      address = build(:address, phone_number: "")
      expect(address).to be_valid
    end

    it "address_last_nameが半角だと登録できないこと" do
      address = build(:address, address_last_name: "tanaka")
      address.valid?
      expect(address.errors[:address_last_name]).to include("is invalid")
    end

    it "address_first_nameが半角だと登録できないこと" do
      address = build(:address, address_first_name: "kakuei")
      address.valid?
      expect(address.errors[:address_first_name]).to include("is invalid")
    end

    it "address_last_name_kanaが半角だと登録できないこと" do
      address = build(:address, address_last_name_kana: "tanaka")
      address.valid?
      expect(address.errors[:address_last_name_kana]).to include("is invalid")
    end

    it "address_first_name_kanaが半角だと登録できないこと" do
      address = build(:address, address_first_name_kana: "kakuei")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("is invalid")
    end
    
    it "address_last_name_kanaが漢字だと登録できないこと" do
      address = build(:address, address_last_name_kana: "田中")
      address.valid?
      expect(address.errors[:address_last_name_kana]).to include("is invalid")
    end

    it "address_first_name_kanaが漢字だと登録できないこと" do
      address = build(:address, address_first_name_kana: "角栄")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("is invalid")
    end

    it "address_last_name_kanaがひらがなだと登録できないこと" do
      address = build(:address, address_last_name_kana: "たなか")
      address.valid?
      expect(address.errors[:address_last_name_kana]).to include("is invalid")
    end

    it "address_first_name_kanaがひらがなだと登録できないこと" do
      address = build(:address, address_first_name_kana: "かくえい")
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("is invalid")
    end

  end
end