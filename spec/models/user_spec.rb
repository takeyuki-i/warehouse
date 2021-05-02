require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      name = User.new(name:'',)

    end
    it 'emailが空では登録できない' do

    end
    it 'passwordが空では登録できない' do

    end
    it 'addressが空では登録できない' do

    end
    it 'alarm_emailが空でも登録ができる' do

    end
  end
end
