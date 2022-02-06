require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = build(:user)
  end

  describe '新規登録' do
    context '入力に問題がないとき' do
      it '入力内容に問題がないとき' do
        expect(@user.valid?).to be_truthy
      end

      it 'nameが50文字以下ならok' do
        @user.name = 'a' * 50
        expect(@user.valid?).to be_truthy
      end

      it 'emailが255文字以下ならok' do
        @user.email = "#{'a' * 240}@example.com"
        expect(@user.valid?).to be_truthy
      end

      it 'emailが小文字表示になる' do
        @user.email = 'TEST@example.com'
        @user.save
        expect(@user.reload.email).to eq 'test@example.com'
      end
    end

    context '入力に問題があるとき' do
      it 'nameが入力されてないとき' do
        @user.name = ''
        expect(@user.valid?).to be_falsey
      end

      it 'emailが入力されてないとき' do
        @user.email = ''
        expect(@user.valid?).to be_falsey
      end

      it 'nameが51文字以上のとき' do
        @user.name = 'a' * 51
        expect(@user.valid?).to be_falsey
      end

      it 'emailが256文字以上のとき' do
        @user.email = "#{'a' * 256}@example.com"
        expect(@user.valid?).to be_falsey
      end

      it 'emailが重複して存在するとき' do
        @user.save
        another_user = build(:user)
        another_user.email = @user.email
        expect(another_user.valid?).to be_falsey
      end

      it 'passwordとpassword_confirmationが一致しないとき' do
        @user.password = 'aaa'
        @user.password_confirmation = 'aa'
        expect(@user.valid?).to be_falsey
      end
    end
  end

  describe 'password' do
    it 'passwordが暗号化されているか検証' do
      expect(@user.password_digest).not_to eq 'abc1234'
    end
  end
end
