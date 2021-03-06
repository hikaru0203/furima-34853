require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
     
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'condition_idが未選択だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'cost_idが未選択だと出品できない' do
        @item.cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 0")
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'category_idが未選択だと出品できない' do
        @item.category_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
     
        it '¥299円以下では登録できないこと' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '¥10,000,000以上では登録できないこと' do
          @item.price = 1000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '半角英数混合では登録できないこと' do
            @item.price = '300yen'
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it '半角英語だけでは登録できないこと' do
            @item.price = 'three'
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      
      end
  end
end

  
 
    
    
 
 