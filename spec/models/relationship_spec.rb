require 'rails_helper'

RSpec.describe Relationship, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  describe 'フォロー関係' do
    before do
      @relationship = build(:relationship)
      @user1 = build(:user,id: @relationship.user_id)
      @user2 = build(:user,id: @relationship.follow_id)
    end
    
    context 'followできるとき' do
      it 'relationshipに問題がないとき' do
        expect(@relationship.valid?).to eq(true)
      end
      
      it 'followできているか検証' do
        @relationship.save
        expect(@user1.following?(@user2)).to eq(true)
      end
    end
  end

end
