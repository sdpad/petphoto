require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @comment = build(:comment)
  end

  describe 'バリデーション' do
    context '入力に問題がないとき' do
      it '入力内容に問題がないとき' do
        expect(@comment.valid?).to be_truthy
      end
    end

    context '入力に問題があるとき' do
      it 'contentが入力されてないとき' do
        @comment.content = ''
        expect(@comment.valid?).to be_falsey
      end

      it 'contentが256文字以上のとき' do
        @comment.content = 'a' * 256
        expect(@comment.valid?).to be_falsey
      end
    end
  end
end
