class ProductsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]



  def index
    @products = Product.order("created_at DESC")
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
    
  end
  
  def show
    
  end



  private

  def product_params
          params.require(:product).permit(:image, :name, :description, :status_id, :category_id, :shopping_days_id, :shipping_charge_id, :prefecture_id, :price, :user_id).merge(user_id: current_user.id)
  end
  
end
