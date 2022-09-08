require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_destination).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_destination.building_name = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_destination.postal_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_destination.postal_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_destination.prefecture_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include()
      end
      it 'product_idが空だと保存できないこと' do
        @purchase_destination.product_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Product can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it "tokenが空では保存できないこと" do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "phone_numberが空では保存できないこと" do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "phone_numberが9桁以下では保存できないこと" do
        @purchase_destination.phone_number = '012345678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上では保存できないこと" do
        @purchase_destination.phone_number = 'min_length: 12'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid", "Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberに半角数字以外が含まれている場合は保存できないこと" do
        @purchase_destination.phone_number = '012345678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "cityが空では保存できないこと" do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では保存できないこと" do
        @purchase_destination.house_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("House number can't be blank")
      end
    end
  end
end