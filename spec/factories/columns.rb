FactoryBot.define do
  factory :column do
    status { "MyString" }
    project { create(:project) }
  end
end
