require 'rails_helper'

RSpec.describe User, type: :model do
  context 'can save' do
    it "全カラムが存在すれば登録できる事" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以上で登録できること" do
      user = build(:user, password: "password", password_confirmation: "password")
      user.valid?
      expect(user).to be_valid
    end

    it "first_name_kanaが全角で登録できること" do
      user = build(:user, first_name_kana: "ミウラ")
      user.valid?
      expect(user).to be_valid
    end

    it "last_name_kanaが全角で登録できること" do
      user = build(:user, last_name_kana: "イッセイ")
      user.valid?
      expect(user).to be_valid
    end
  end

  context 'can not save' do
    it "first_nameが空では登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください") 
    end

    it "first_nameが半角では登録できないこと" do
      user = build(:user, first_name: "miura")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です") 
    end

    it "last_nameが空では登録できないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください") 
    end
  
    it "last_nameが半角では登録できないこと" do
      user = build(:user, last_name: "issei")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です") 
    end

    it "first_name_kanaが空では登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください") 
    end

    it "first_name_kanaが半角カナでは登録できないこと" do
      user = build(:user, first_name_kana: "ﾐｳﾗ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です") 
    end

    it "last_name_kanaが空では登録できないこと" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください") 
    end

    it "last_name_kanaが半角カナでは登録できないこと" do
      user = build(:user, last_name_kana: "ｲｯｾｲ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です") 
    end

    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください") 
    end

    it "postcodeが空では登録できないこと" do
      user = build(:user, postcode: "")
      user.valid?
      expect(user.errors[:postcode]).to include("を入力してください") 
    end

    it "prefectureが空では登録できないこと" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("を入力してください") 
    end

    it "cityが空では登録できないこと" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください") 
    end

    it "blockが空では登録できないこと" do
      user = build(:user, block: "")
      user.valid?
      expect(user.errors[:block]).to include("を入力してください") 
    end

    it "buildingが空では登録できないこと" do
      user = build(:user, building: "")
      user.valid?
      expect(user.errors[:building]).to include("を入力してください") 
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください") 
    end
  
    it "phone_numberが空では登録できないこと" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください") 
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください") 
    end
    
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください") 
    end

    it "passwordが6文字では登録できないこと" do
      user = build(:user, password: "passwo", password_confirmation: "passwo")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください") 
    end
  end
end
