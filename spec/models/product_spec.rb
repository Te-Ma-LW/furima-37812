require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe "商品出品機能" do
    context '商品を出品できる時' do 
      it 'name,description,category_id,status_id,prefecture_id,shopping_days_id,shipping_charge_id,price,userが存在すれば登録できる' do
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
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it "status_idが空では登録できない" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Status can't be blank"
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
      it "shopping_days_idが空では登録できない" do
        @product.shopping_days_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shopping days can't be blank"
      end
      it "priceが空では登録できない" do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it "priceは全角カナでは登録できない" do
        @product.price = 'あああ'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
      it "価格が300円未満では出品できない" do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
      it "価格が9,999,999円を超えると出品できない" do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
      it "userが紐付いていなければ出品できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "User must exist"
      end
    end
  
  end
end

      
      
      
  
