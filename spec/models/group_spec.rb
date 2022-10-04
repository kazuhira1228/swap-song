require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'ユーザー新規登録' do
    context '保存できる場合' do
      it '正しい情報が入力されていれば保存できる' do
        expect(@group).to be_valid
      end
    end

    context '保存できない場合' do
      it 'groupが空では保存できない' do
        @group.group = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Group can't be blank")
      end

      it 'first_userが空では保存できない' do
        @group.first_user = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("First user can't be blank")
      end

      it 'second_userが空では保存できない' do
        @group.second_user = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Second user can't be blank")
      end

      it 'third_userが空では保存できない' do
        @group.third_user = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Third user can't be blank")
      end

      it 'fourth_userが空では保存できない' do
        @group.fourth_user = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Fourth user can't be blank")
      end

      it 'fifth_userが空では保存できない' do
        @group.fifth_user = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Fifth user can't be blank")
      end

      it 'group_sinceが空では保存できない' do
        @group.group_since = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Group since can't be blank")
      end

      it 'textが空では保存できない' do
        @group.text = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end