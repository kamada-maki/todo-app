require 'rails_helper'

RSpec.describe TaskCategory, type: :model do
  before do
    @task_category = FactoryBot.build(:task_category)
  end
  describe 'タスク登録' do
    context '登録がうまくいくとき' do
      it '正しく情報を入力すれば登録できる' do
        expect(@task_category).to be_valid
      end
    end
  end
end
