FactoryBot.define do
  factory :comment do
    sequence(:content) { 'test' }
    association :post
    user { post.user }
  end
end
