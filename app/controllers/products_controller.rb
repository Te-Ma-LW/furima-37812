class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  # before_action :move_to_index, except: [:index, :show]


  def index
    @products = Product.order('created_at DESC')
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
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
      @product.destroy
      redirect_to root_path
  end



  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :status_id, :category_id, :shopping_days_id,:shipping_charge_id, :prefecture_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def ensure_current_user
    product = Product.find(params[:id])
    if product.user_id != current_user.id || @product.purchase.present?
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # def move_to_index
  #   unless current_user && @product.purchase == nil 
  #     redirect_to new_user_session_path 
  #   end
  # end

end
