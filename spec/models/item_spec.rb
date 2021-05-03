require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム新規登録' do
    context '新規登録できるとき' do
      it 'name,image,informationがあると登録できる。' do
        expect(@item).to be_valid
      end
      it '画像はなくても登録ができる' do
        @item.image = nil
        expect(@item).to be_valid
      end
      it '商品情報はなくても登録ができる' do
        @item.information = ''
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '商品名がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
    end
  end
end
