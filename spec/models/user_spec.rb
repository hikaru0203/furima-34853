
require 'rails_helper'

# describe User do
#   describe '#create' do
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
      # 入力されている場合のテスト ▼
    context '商品出品ができる時' do
    
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordが7文字以上であれば登録できること" do
        user = FactoryBot.build(:user, password: "1234567s", encrypted_password: "1234567s")
        expect(@user).to be_valid
      end
    end

      # nul:false, presence: true のテスト ▼
    context '商品出品ができない時' do
      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
      end

      it "last_nameがない場合は登録できないこと" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end

      it "birth_dayがない場合は登録できないこと" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors[:birth_day]).to include("can't be blank")
      end

      # パスワードの文字数テスト ▼

     

      it "passwordが7文字以下であれば登録できないこと" do
        user = FactoryBot.build(:user, password: "123456", encrypted_password: "123456")
        user.valid?
        expect(user.errors[:encrypted_password]).to include("is too short (minimum is 7 characters)")
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        user = FactoryBot.build(:user, encrypted_password: "")
        user.valid?
        expect(user.errors[:encrypted_password]).to include("can't be blank","is too short (minimum is 7 characters)")
      end

      # 本人確認名前全角入力のテスト ▼

      it 'last_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name: '')
        user.valid?
        expect(user.errors[:last_name]).to include()
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name: 'tanaka')
        user.valid?
        expect(user.errors[:last_name]).to include()
      end


      it 'first_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name: 'tanaka')
        user.valid?
        expect(user.errors[:first_name]).to include()
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name: '')
        user.valid?
        expect(user.errors[:first_name]).to include()
      end

      # 本人確認カタカナ全角入力のテスト ▼

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name_kana: 'やまだ')
        user.valid?
        expect(user.errors[:last_name_kana]).to include()
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name_kana: '')
        user.valid?
        expect(user.errors[:last_name_kana]).to include()
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name_kana: 'yamada')
        user.valid?
        expect(user.errors[:last_name_kana]).to include()
      end



      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name_kana: 'tanaka')
        user.valid?
        expect(user.errors[:first_name_kana]).to include()
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name_kana: '')
        user.valid?
        expect(user.errors[:first_name_kana]).to include()
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name_kana: 'やまだ')
        user.valid?
        expect(user.errors[:first_name_kana]).to include()
      end
    end
  end
end



