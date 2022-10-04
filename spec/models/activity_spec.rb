require 'rails_helper'

RSpec.describe Activity, type: :model do
  before do
    @act = FactoryBot.build(:activity)
  end

  describe 'ユーザー新規登録' do
    context '保存できる場合' do
      it '正しい情報が入力されていれば保存できる' do
        expect(@act).to be_valid
      end
    end

    context '保存できない場合' do
      it 'groupが空では保存できない' do
        @act.group = ''
        @act.valid?
        expect(@act.errors.full_messages).to include("Group can't be blank")
      end

      it 'activity_dayが空では保存できない' do
        @act.activity_day = ''
        @act.valid?
        expect(@act.errors.full_messages).to include("Activity day can't be blank")
      end

      it 'songが空では保存できない' do
        @act.song = ''
        @act.valid?
        expect(@act.errors.full_messages).to include("Song can't be blank")
      end

      it 'studioが空では保存できない' do
        @act.studio = ''
        @act.valid?
        expect(@act.errors.full_messages).to include("Studio can't be blank")
      end

      it 'textが空では保存できない' do
        @act.text = ''
        @act.valid?
        expect(@act.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end