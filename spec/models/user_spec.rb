require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '会員登録' do
    context '登録がうまくいくとき' do
      it '正しく情報を入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録が上手くいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Nameを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailを入力してください')
      end
      it 'emailがに＠が含まれないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordを入力してください', 'Password confirmationとPasswordの入力が一致しません')
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'aaa12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません', 'Passwordは6文字以上で入力してください')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc124'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end
    end
  end
end
