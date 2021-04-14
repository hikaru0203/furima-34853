require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @pay_form = FactoryBot.build(:pay_form, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@pay_form).to be_valid
      end
     
      it '建物番号が空の場合でも登録できる' do
        @pay_form.building = nil
        expect(@pay_form).to be_valid
      end

    end
    context '商品購入がうまくいかない時' do
      it 'zip_codeが空だと購入できない' do
        @pay_form.zip_code = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeにハイフンがないと購入できない' do
        @pay_form.zip_code = "1234567"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Zip code is invalid")
      end
      it 'prefecture_idが未選択だと購入できない' do
        @pay_form.prefecture_id = 0
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'cityが空だと購入できない' do
        @pay_form.city = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @pay_form.address = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @pay_form.phone_number = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満では購入できない' do
        @pay_form.phone_number = "090123457"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上の場合は購入できない' do
        @pay_form.phone_number = "0901234573332333"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberに数字以外の記述があると購入できない' do
        @pay_form.phone_number = "03499ge33"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end


        it "tokenが空では登録できないこと" do
          @pay_form.token = nil
          @pay_form.valid?
          expect(@pay_form.errors.full_messages).to include("Token can't be blank")
        end

        it "user_idが空では登録できないこと" do
          @pay_form.user_id = nil
          @pay_form.valid?
          expect(@pay_form.errors.full_messages).to include("User can't be blank")
        end

        it "item_idが空では登録できないこと" do
          @pay_form.item_id= nil
          @pay_form.valid?
          expect(@pay_form.errors.full_messages).to include("Item can't be blank")
        end

    end
  end
end
