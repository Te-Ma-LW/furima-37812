require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe "商品出品機能" do
    context '商品を出品できる時' do 
      it 'name,description,category_id,product_status_id,prefecture_id,scheduled_delivery_id,shipping_charge_id,product_price_id,user_idが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    
    context '商品を出品できない時' do 
      it "imageが空では登録できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空では登録できない" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
      # it "nameが40文字以上では登録できない" do
      #   @product.name = ''
      #   @product.valid?
      #   expect(@product.errors.full_messages).to include "Name can't be blank"
      # end
      it "descriptionが空では登録できない" do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end
      # it "descriptionが1000文字以上では登録できない" do
      #   @product.description = ''
      #   @product.valid?
      #   expect(@product.errors.full_messages).to include "Description is too long (maximum is 999 characters)"
      # end
      it "category_idが空では登録できない" do
        @product.category_id = ''
        @product.valid?
        # binding.pry
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it "product_status_idが空では登録できない" do
        @product.product_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product status can't be blank"
      end
      it "shipping_charge_idが空では登録できない" do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it "prefecture_idが空では登録できない" do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "scheduled_delivery_idが空では登録できない" do
        @product.scheduled_delivery_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it "product_price_idが空では登録できない" do
        @product.product_price_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product price can't be blank"
      end
      it "product_price_idは全角カナでは登録できない" do
        @product.product_price_id = 'あああ'
        @product.valid?
        expect(@product.errors.full_messages).to include "Product price is not a number"
      end
    end
  end
end

      
      
      
  
