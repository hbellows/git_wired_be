FactoryBot.define do
  factory :user do
    email { 'jawesome@gmail.com' }
    user_name { 'jordanwa1947' }
    github_id { 1234 }
    token { '123abc' }
  end
end
