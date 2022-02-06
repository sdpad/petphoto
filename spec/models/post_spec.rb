require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @post = build(:post)
  end

  describe 'バリデーション' do
    context '入力に問題がないとき' do
      it '入力内容に問題がないとき' do
        expect(@post.valid?).to be_truthy
      end

      it 'contentが255文字以下ならok' do
        @post.content = 'a' * 255
        expect(@post.valid?).to be_truthy
      end
    end

    context '入力に問題があるとき' do
      it 'contentが入力されてないとき' do
        @post.content = ''
        expect(@post.valid?).to be_falsey
      end

      it 'imgが入力されてないとき' do
        @post.img = ''
        expect(@post.valid?).to be_falsey
      end

      it 'contentが256文字以上のとき' do
        @post.content = 'a' * 256
        expect(@post.valid?).to be_falsey
      end
    end
  end
end
