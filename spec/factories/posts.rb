FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "content#{n}" }
    sequence(:img) { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/factories/heart.svg')) }
    association :user
  end
end
