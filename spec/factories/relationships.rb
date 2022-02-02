FactoryBot.define do
  factory :relationship do
    association :user
    user_id { FactoryBot.create(:user).id }
    follow_id {FactoryBot.create(:user).id }
  end
end
