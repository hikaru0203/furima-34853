require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @pay_form = FactoryBot.build(:pay_form)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
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
      it 'phone_numberが10桁では購入できない' do
        @pay_form.phone_number = "090123457"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end


        it "tokenが空では登録できないこと" do
          @pay_form.token = nil
          @pay_form.valid?
          expect(@pay_form.errors.full_messages).to include("Token can't be blank")
        end

    end
  end
end
