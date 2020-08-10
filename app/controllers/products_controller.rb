class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :ensure_currect_user, only: [:edit, :update, :destroy]
  before_action :Login_required, only: [:new]
  before_action :category_map, only: [:edit, :update]

  def index
    @products = Product.includes(:product_images).order('created_at DESC').where.not(trading_status: 0)
  end  

  def new
    @product = Product.new
    @product.product_images.build
    @category_parent_array = Category.where(ancestry: nil)
  end

  def show
    @images = @product.product_images
    @category_parent_array = Category.where(ancestry: nil)
    @category_grandchild = @product.category
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def destroy
    if @product.destroy 
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to product_path(params[:id]), notice: "権限がありません"
    end
  end

  def create
    @category_parent_array = Category.where(ancestry: nil)
    @product = Product.new(product_params)    
    unless @product.save
      @product.product_images.clear
      @product.product_images.build if @product.product_images.blank?   #画像が一枚も投稿されていない場合buildメソッドを実行
      render :new
    end
    @images = @product.product_images
    @category_grandchild = @product.category
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
  end

  def edit
    @category_parent_array = Category.where(ancestry: nil)
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def update
    @category_parent_array = Category.where(ancestry: nil)
    if @product.update(product_params) 
      redirect_to product_path(params[:id]), notice: "更新が完了しました"
    else
      render :edit
    end  
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def update_done
    @product = Product.where(user_id: current_user.id).last
    @product_update = Product.order("updated_at DESC").first
  end

  def search
      @products = Product.where('product_name LIKE(?)', "%#{params[:search]}%").limit(20)
  end

  private
  def product_params
    params.require(:product).permit(
      :product_name,      #商品名
      :description,       #商品説明   
      :price,             #価格
      :brand_id,          #ブランド名
      :product_status,    #商品の状態
      :prefecture_id,     #都道府県
      :size,              #サイズ
      :shipping_fee,      #配送料 
      :shipping_day,      #発送までの日数
      :shipping_type,     #配送方法
      :category_id,       #カテゴリ
      :deal_closed_date,  #取引成立日時
      product_images_attributes: [:image,:_destroy, :id]   #画像複数枚添付用
    )
    .merge(
      seller_id: current_user.id, #ユーザID：ログイン中のユーザID
      trading_status: 1         #売買状況：売出し中（1）
    )  
  end  

  def set_product
    @product = Product.find(params[:id])
  end  

  def ensure_currect_user
    if current_user.id != @product.seller_id
      flash[:alert] = "権限がありません"
      redirect_to product_path(params[:id])
    end
  end

  def Login_required
    unless user_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end

  def category_map
    grandchild = @product.category
    child = grandchild.parent
    if @category_id == 46 or @category_id == 74 or @category_id == 134 or @category_id == 142 or @category_id == 147 or @category_id == 150 or @category_id == 158
    else
      @parent_array = []
      @parent_array << @product.category.parent.parent.name
      @parent_array << @product.category.parent.parent.id
    end
    @category_children_array = Category.where(ancestry: child.ancestry)
    @child_array = []
    @child_array << child.name
    @child_array << child.id

    @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
    @grandchild_array = []
    @grandchild_array << grandchild.name
    @grandchild_array << grandchild.id
  end
end
