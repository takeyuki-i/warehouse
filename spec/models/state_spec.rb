require 'rails_helper'

RSpec.describe State, type: :model do
  before do
    @state = FactoryBot.build(:state)
  end

  describe '在庫情報の新規登録' do
    context '新規登録できるとき' do
      it 'quantitiy,unit_id,limit_id,limit_day,storage_name,storage_addressがあると登録できる。' do
        expect(@state).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '数量がないと登録できない' do
        @state.quantity = ''
        @state.valid?
        expect(@state.errors.full_messages).to include "Quantity can't be blank", "Quantity is invalid", "Quantity is not a number", "Quantity is not a number"
      end
      it '数量は全角数字では登録できない' do
        @state.quantity = '２００００'
        @state.valid?
        expect(@state.errors.full_messages).to include "Quantity is invalid", "Quantity is not a number", "Quantity is not a number"
      end
      it '数量は半角英字では登録できない' do
        @state.quantity = 'abc'
        @state.valid?
        expect(@state.errors.full_messages).to include "Quantity is invalid", "Quantity is not a number", "Quantity is not a number"
      end
      it '価格は半角英数字混合では登録できない' do
        @state.quantity = 'ab12345'
        @state.valid?
        expect(@state.errors.full_messages).to include "Quantity is invalid", "Quantity is not a number", "Quantity is not a number"
      end
      it '数量は0では登録できない' do
        @state.quantity = '0'
        @state.valid?
        expect(@state.errors.full_messages).to include "Quantity must be greater than or equal to 1"
      end
      it '数量は9,999,999以上では登録できない' do
        @state.quantity = '10000000'
        @state.valid?
        expect(@state.errors.full_messages).to include "Quantity must be less than or equal to 9999999"
      end
      it '単位がないと登録ができない' do
        @state.unit_id = ''
        @state.valid?
        expect(@state.errors.full_messages).to include "Unit can't be blank", "Unit is not a number"
      end
      it '単位はidが1では登録ができない' do
        @state.unit_id = '1'
        @state.valid?
        expect(@state.errors.full_messages).to include "Unit must be other than 1"
      end
      it '使用期限の有無が選択されないと登録ができない' do
        @state.limit_id = ''
        @state.valid?
        expect(@state.errors.full_messages).to include "Limit can't be blank", "Limit is not a number"
      end
      it '使用期限のidが1では登録ができない' do
        @state.limit_id = '1'
        @state.valid?
        expect(@state.errors.full_messages).to include "Limit must be other than 1"
      end
      it '保管場所の名称がないと登録ができない' do
        @state.storage_name = ''
        @state.valid?
        expect(@state.errors.full_messages).to include "Storage name can't be blank", "Storage name is invalid"
      end
      it '保管場所の住所がないと登録ができない' do
        @state.storage_address = ''
        @state.valid?
        expect(@state.errors.full_messages).to include "Storage address can't be blank"
      end
    end
  end
end