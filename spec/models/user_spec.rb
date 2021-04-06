
require 'rails_helper'

describe User do
  describe '#create' do

      # 入力されている場合のテスト ▼

      it "全ての項目の入力が存在すれば登録できること" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end

      # nul:false, presence: true のテスト ▼

      it "nicknameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        user = FactoryBot.build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("can't be blank")
      end

      it "last_nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        user = FactoryBot.build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user = FactoryBot.build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it "birth_dayがない場合は登録できないこと" do
        user = FactoryBot.build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("can't be blank")
      end

      # パスワードの文字数テスト ▼

      it "passwordが7文字以上であれば登録できること" do
        user = FactoryBot.build(:user, password: "1234567s", encrypted_password: "1234567s")
        expect(user).to be_valid
      end

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
        user = FactoryBot.build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include()
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include()
      end

      # 本人確認カタカナ全角入力のテスト ▼

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include()
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include()
      end
  end
end
