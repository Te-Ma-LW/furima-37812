class ProductsController < ApplicationController
  
  before_action :authenticate_user!, except: :index



  def index
    # @products = Product.order("created_at DESC")
  end
 
  def new
    @product = Product.new
  end
  
  def save
    @product = Product.save(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def product_params
          params.require(:product).permit(:image, :name, :description, :status_id, :category_id, :shopping_days_id, :shipping_charge_id, :prefecture_id, :price, :user).merge(user: current_user.id)
  end
  
end
