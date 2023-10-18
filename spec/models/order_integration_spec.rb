require 'rails_helper'

RSpec.describe OrderIntegration, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_integration = FactoryBot.build(:order_integration, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_integration).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_integration.building = ''
        expect(@order_integration).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_integration.postcode = ''
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ形式でないと保存できないこと' do
        @order_integration.postcode = '1234567'
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_integration.prefecture_id = '1'
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_integration.municipality = ''
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_integration.address = ''
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_integration.phone = ''
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @order_integration.phone = '080-7300-3711'
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Phone should be 10 to 11 digits in length and contain only half-width numbers")
      end
      it "phoneが9桁以下の場合だと保存できないこと" do
        @order_integration.phone = '123456789'
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Phone should be 10 to 11 digits in length and contain only half-width numbers")
      end
      it "phoneが12桁以上の場合保存できないこと" do
        @order_integration.phone = '1234567891012'
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Phone should be 10 to 11 digits in length and contain only half-width numbers")
      end
      it "phoneが半角数字以外が含まれている場合保存できないこと" do
        @order_integration.phone = '123abc56789'
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Phone should be 10 to 11 digits in length and contain only half-width numbers")
      end
      it 'tokenが空だと保存できないこと' do
        @order_integration.token = ''
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていない場合保存できない' do
        @order_integration.user_id = nil
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていない場合保存できない' do
        @order_integration.item_id = nil
        @order_integration.valid?
        expect(@order_integration.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
