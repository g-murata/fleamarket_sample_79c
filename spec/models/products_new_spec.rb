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

    it "prefectureが空では出品不可" do
      product = build(:product, prefecture: "")
      product.valid?
      expect(product.errors[:prefecture]).to include("を入力してください")
    end

    it "sizeが空では出品不可" do
      product = build(:product, size: "")
      product.valid?
      expect(product.errors[:size]).to include("を入力してください")
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

  end
end