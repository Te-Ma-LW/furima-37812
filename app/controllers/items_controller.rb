class ItemsController < ApplicationController

  def index
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  
end
