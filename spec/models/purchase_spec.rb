require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase_destination = FactoryBot.build(:order)
  end

  # context '内容に問題ない場合' do
  #   it "priceとtokenがあれば保存ができること" do
  #     expect(@purchase_destination).to be_valid
  #   end
  # end

  # context '内容に問題がある場合' do
  #   # it "priceが空では保存ができないこと" do
  #   #   @purchase_destination.price = nil
  #   #   @purchase_destination.valid?
  #   #   expect(@purchase_destination.errors.full_messages).to include("Price can't be blank")
  #   # end

    
  end
end
