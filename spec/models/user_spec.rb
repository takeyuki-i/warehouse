require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'name,email,addreess,passwordがあれば登録出来る' do
      expect(@user).to be_valid
      end
      it 'alarm_emailが空でも登録ができる' do
        @user.address = ''
        @user.valid?
      end
    end
    context '新規登録できないとき' do
      it 'ユーザーは名前がないと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'ユーザーの名前は全角でないと登録できない' do
        @user.name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is invalid"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailは@がないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'emailに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordは全角が含まれると登録できない' do
        @user.password = 'ａｂｃ123456'
        @user.password_confirmation = 'ａｂｃ123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordは、確認用を含めて２回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordと確認用が一致しないと登録できない' do
        @user.password_confirmation = 'another123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'addressが空では登録できない' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Address can't be blank"
      end
    end
  end
end
