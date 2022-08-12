class ProductsController < ApplicationController
  
  # before_action :authenticate_user!



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
        # <%= f.text_field :product_price_id, class:"price-input", id:"product-price", placeholder:"例）300" %>

        # <%= f.collection_select(:prefecture_id, Prefecture.all, :id, :name, {}, {class:"select-box", id:"item-prefecture"}) %>

        # <%= f.collection_select(:prefecture_id, Prefecture.all, :id, :name, {}, {class:"select-box", id:"item-prefecture"}) %>
        
          params.require(:product).permit(:image, :name, :description, :product_status_id, :category_id, :scheduled_delivery_id, :shipping_charge_id, :prefecture_id, :product_price_id).merge(user_id: current_user.id)
  end
  
end
