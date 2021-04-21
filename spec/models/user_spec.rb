require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      
      it 'nicknameが20文字以内だと登録できる' do
        @user.nickname = "aaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが一致していて、半角英数混合であれば登録できる' do
        @user.password = "danburudoa515"
        @user.password_confirmation = "danburudoa515"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      
      it 'nicknameが21文字以上では登録できない' do
        @user.nickname = "aaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameは20文字以内で入力してください")
      end
    end
  end
end

