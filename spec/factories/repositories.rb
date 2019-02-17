FactoryBot.define do
  factory :repository do
    title { "MyString" }
    user { create(:user) }
  end
end
