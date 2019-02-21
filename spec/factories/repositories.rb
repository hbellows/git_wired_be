FactoryBot.define do
  factory :repository do
    name { "sweater-weather-fe" }
    github_id { 1 }
    html_url { "https://github.com/jordanwa1947/sweater-weather" }
  end
end
