require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family1が空では登録できない' do
        @user.family1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family1 can't be blank"
      end
      it 'name1が空では登録できない' do
        @user.name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name1 can't be blank"
      end
      it 'family2が空では登録できない' do
        @user.family2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family2 can't be blank"
      end
      it 'name2が空では登録できない' do
        @user.name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name2 can't be blank"
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
    end
  end
