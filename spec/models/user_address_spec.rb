require 'rails_helper'
describe UserAddress do
  describe '#create' do
    context 'ユーザーアドレス登録ができる' do
      it '必須項目が全て入力してあれば登録できる' do
        expect(build(:user_address)).to be_valid
      end

      it "building_nameが空でも登録できる" do
        user_address = build(:user_address, building_name: nil)
        expect(user_address).to be_valid
      end

      it "phone_numberが空でも登録できる" do
        user_address = build(:user_address, phone_number: nil)
        expect(user_address).to be_valid
      end
    end

    context 'ユーザーアドレス登録ができない' do
      it "address_last_nameがない場合は登録できないこと" do
        user_address = build(:user_address, address_last_name: nil)
        user_address.valid?
        expect(user_address.errors[:address_last_name]).to include("を入力してください")
      end

      it "address_first_nameがない場合は登録できないこと" do
        user_address = build(:user_address, address_first_name: nil)
        user_address.valid?
        expect(user_address.errors[:address_first_name]).to include("を入力してください")
      end

      it "address_last_name_kanaがない場合は登録できないこと" do
        user_address = build(:user_address, address_last_name_kana: nil)
        user_address.valid?
        expect(user_address.errors[:address_last_name_kana]).to include("を入力してください")
      end

      it "address_first_name_kanaがない場合は登録できないこと" do
        user_address = build(:user_address, address_first_name_kana: nil)
        user_address.valid?
        expect(user_address.errors[:address_first_name_kana]).to include("を入力してください")
      end

      it "zip_codeがない場合は登録できないこと" do
        user_address = build(:user_address, zip_code: nil)
        user_address.valid?
        expect(user_address.errors[:zip_code]).to include("を入力してください")
      end

      it "prefecture_idがない場合は登録できないこと" do
        user_address = build(:user_address, prefecture_id: nil)
        user_address.valid?
        expect(user_address.errors[:prefecture_id]).to include("を入力してください")
      end

      it "cityがない場合は登録できないこと" do
        user_address = build(:user_address, city: nil)
        user_address.valid?
        expect(user_address.errors[:city]).to include("を入力してください")
      end

      it "cityがない場合は登録できないこと" do
        user_address = build(:user_address, city: nil)
        user_address.valid?
        expect(user_address.errors[:city]).to include("を入力してください")
      end

      it "streetがない場合は登録できないこと" do
        user_address = build(:user_address, street: nil)
        user_address.valid?
        expect(user_address.errors[:street]).to include("を入力してください")
      end

      it "streetがない場合は登録できないこと" do
        user_address = build(:user_address, street: nil)
        user_address.valid?
        expect(user_address.errors[:street]).to include("を入力してください")
      end

      it "address_last_name_kanaが全角平仮名でないと登録できないこと" do
        user_address = build(:user_address, address_last_name_kana: "アベ")
        user_address.valid?
        expect(user_address.errors[:address_last_name_kana]).to include("は不正な値です")
      end

      it "address_first_name_kanaが全角平仮名でないと登録できないこと" do
        user_address = build(:user_address, address_first_name_kana: "タロウ")
        user_address.valid?
        expect(user_address.errors[:address_first_name_kana]).to include("は不正な値です")
      end

      it "zip_codeが7文字以外では登録できない" do
        user_address = build(:user_address, zip_code: 88888888)
        user_address.valid?
        expect(user_address.errors[:zip_code]).to include("は不正な値です")
      end
    end
  end
end