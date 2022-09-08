class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @purchase_destination = PurchaseDestination.new
  end
  
  

  
  
  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if 
      @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render 'index'
    end
  end



  private

    def purchase_params
      params.require(:purchase_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :product, :token).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: params[:token],  
        currency: 'jpy'                 
      )
    end

    def move_to_index
      if current_user.id == @product.user.id || @product.purchase.present?
        redirect_to root_path
      end
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

end
