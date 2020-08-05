class BuyersController < ApplicationController
  require 'payjp'#Payjpの読み込み
  require 'date'
  before_action :set_card, :set_product
  before_action :check_status
  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to user_path(current_user.id), notice: "プロフィール編集でクレジットカードの登録を行ってください"
      
    else
      Payjp.api_key = Rails.application.credentials.development[:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end

    @user_address = UserAddress.find_by(user_id: current_user.id)
  end

  def pay
    Payjp.api_key = Rails.application.credentials.development[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      :amount => @product.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    @product.buyer_id = current_user.id
    @product.deal_closed_date = Time.now
    if @product.save
      redirect_to done_product_buyers_path #完了画面に移動
    else
      render :index
    end
  end

  def done
    if @product.buyer_id != nil
      @product.trading_status = 0
      unless @product.save
        render :index
      end
    else
      redirect_to products_path, notice: "権限がありません"
    end
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.find_by(product_id: @product.id)
  end

  def check_status
    @product = Product.find(params[:product_id])
    if  @product.trading_status == 0
      redirect_to root_path
    end
  end
  
end