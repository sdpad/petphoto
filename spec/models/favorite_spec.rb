require 'rails_helper'

RSpec.describe Favorite, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @favorite = build(:favorite)
    # @user = build(:user,id: @favorite.user_id)
    # @post = build(:post,id: @favorite.post_id)
  end

  it 'favoriteできるか確認' do
    expect(@favorite.valid?).to be_truthy
  end
end
