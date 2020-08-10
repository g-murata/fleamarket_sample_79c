require 'rails_helper'

describe Product do
  describe '#create' do

    it "product_nameが空だと出品不可" do
      product = build(:product, product_name: "")
      product.valid?
      expect(product.errors[:product_name]).to include("を入力してください")
    end

    it "descriptionが空では出品不可" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "priceが空では出品不可" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "brand_idが空でも出品『可』" do
      product = build(:product, brand_id: "")
      product.valid?
      expect(product).to be_valid
    end

    it "product_statusが空では出品不可" do
      product = build(:product, product_status: "")
      product.valid?
      expect(product.errors[:product_status]).to include("を入力してください")
    end

    it "prefecture_idが空では出品不可" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end

    it "sizeが空でも出品『可』" do
      product = build(:product, size: "")
      product.valid?
      expect(product).to be_valid
    end

    it "shipping_dayが空では出品不可" do
      product = build(:product, shipping_day: "")
      product.valid?
      expect(product.errors[:shipping_day]).to include("を入力してください")
    end

    it "shipping_typeが空では出品不可" do
      product = build(:product, shipping_type: "")
      product.valid?
      expect(product.errors[:shipping_type]).to include("を入力してください")
    end

    it "shipping_feeが空では出品不可" do
      product = build(:product, shipping_fee: "")
      product.valid?
      expect(product.errors[:shipping_fee]).to include("を入力してください")
    end

    it "category_idが空では出品不可" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "trading_statusが空では出品不可" do
      product = build(:product, trading_status: "")
      product.valid?
      expect(product.errors[:trading_status]).to include("を入力してください")
    end

    it "seller_idが空では出品不可" do
      product = build(:product, seller_id: nil)
      product.valid?
      expect(product.errors[:seller_id]).to include("を入力してください")
    end



    it "product_name 文字数チェック 41字以上の場合登録できないこと" do
      product = build(:product, product_name: "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddde")
      product.valid?
      expect(product.errors[:product_name]).to include("は40文字以内で入力してください")
    end

    it "product_name 文字数チェック 40字以下の場合登録できること" do
      product = build(:product, product_name: "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddd")
      expect(product).to be_valid
    end


    it "price 数値チェック 金額が300円未満の場合登録できないこと" do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("は299より大きい値にしてください")
    end

    it "price 数値チェック 金額が300円以上の場合登録できること" do
      product = build(:product, price: "300")
      expect(product).to be_valid
    end

    it "price 数値チェック 金額が50000円を超える場合登録できないこと" do
      product = build(:product, price: "50001")
      product.valid?
      expect(product.errors[:price]).to include("は50001より小さい値にしてください")
    end

    
    it "price 数値チェック 金額が50000円以下の場合登録できること" do
      product = build(:product, price: "50000")
      expect(product).to be_valid
    end



  end
end