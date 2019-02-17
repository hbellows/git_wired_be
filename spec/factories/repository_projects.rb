FactoryBot.define do
  factory :repository_project do
    repository { create(:repository) }
    project { create(:project) }
  end
end
