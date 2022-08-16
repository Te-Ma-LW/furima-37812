class ProductsController < ApplicationController
  
  before_action :authenticate_user!, except: [:show, :index]



  def index
    @products = Product.order("created_at DESC")
  end
 
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def product_params
          params.require(:product).permit(:image, :name, :description, :product_status_id, :category_id, :scheduled_delivery_id, :shipping_charge_id, :prefecture_id, :product_price_id, :user_id).merge(user_id: current_user.id)
  end
  
end
