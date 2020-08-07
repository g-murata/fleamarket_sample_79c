class HomeController < ApplicationController
  def index
    @products = Product.includes(:product_images).order('created_at DESC').limit(4).where.not(trading_status: 0)
    @categories = Product.includes(:product_images).where(category_id:1..4).order('created_at DESC').limit(4).where.not(trading_status: 0)
  end
end