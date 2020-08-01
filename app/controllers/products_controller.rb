class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build
    @category = Category.all
    @brand = Brand.all
  end

  def create
    @product = Product.new(product_params)    
    if @product.save
      
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(
      :product_name,      #商品名
      :description,       #商品説明   
      :price,             #価格
      :brand_id,          #ブランド名
      :product_status,    #商品の状態
      #:buyer_address,     #購入者    #一時的にNULL　
      :prefecture,        #都道府県
      :size,              #サイズ一時的にNULL      
      :shipping_fee,      #配送料 
      :shipping_day,      #発送までの日数
      :shipping_type,     #配送方法
      :category_id,       #カテゴリ
      #:buyer,            #購入者
      :deal_closed_date,  #取引成立日時
      product_images_attributes: [:image]   #画像複数枚添付用     
    )
    .merge(
      user_id: current_user.id, #ユーザID：ログイン中のユーザID
      trading_status: 1         #売買状況：売出し中
    )  
  end  

end
