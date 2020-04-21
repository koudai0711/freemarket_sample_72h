require 'rails_helper'
describe User do
  describe '#create' do

    it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "emailに＠がない場合は登録できないこと" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "emailにドメインがない場合は登録できないこと" do
      user = build(:user, email: "kkk@gmail")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "last_nameが半角だと登録できないこと" do
      user = build(:user, last_name: "tanaka")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    it "first_nameが半角だと登録できないこと" do
      user = build(:user, first_name: "kakuei")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    it "last_name_kanaが半角だと登録できないこと" do
      user = build(:user, last_name_kana: "tanaka")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    it "first_name_kanaが半角だと登録できないこと" do
      user = build(:user, first_name_kana: "kakuei")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    
    it "last_name_kanaが漢字だと登録できないこと" do
      user = build(:user, last_name_kana: "田中")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    it "first_name_kanaが漢字だと登録できないこと" do
      user = build(:user, first_name_kana: "角栄")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "last_name_kanaがひらがなだと登録できないこと" do
      user = build(:user, last_name_kana: "たなか")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    it "first_name_kanaがひらがなだと登録できないこと" do
      user = build(:user, first_name_kana: "かくえい")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    
  end
end