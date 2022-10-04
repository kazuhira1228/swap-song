require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '保存できる場合' do
      it '正しい情報が入力されていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '保存できない場合' do
      it 'nicknameが空では保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと保存できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが英語のみでは保存できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが数字のみでは保存できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角だと保存できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordは5文字以下では保存できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが不一致では保存できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'sexが1では保存できない' do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex can't be blank")
      end

      it 'prefectureが1では保存できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it 'holidayが1では保存できない' do
        @user.holiday_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Holiday can't be blank")
      end

      it 'member_sinceが空では保存できない' do
        @user.member_since = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Member since can't be blank")
      end

      it 'favorite_partが空では保存できない' do
        @user.favorite_part = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Favorite part can't be blank")
      end

      it 'favorite_singerが空では保存できない' do
        @user.favorite_singer = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Favorite singer can't be blank")
      end

      it 'groupが空では保存できない' do
        @user.group = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Group can't be blank")
      end

      it 'more_joinが1では保存できない' do
        @user.more_join_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("More join can't be blank")
      end
    end
  end
end