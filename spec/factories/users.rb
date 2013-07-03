# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence (:email) { |n| "em@i#{}.ls" }
    sequence (:password) { |n| "pass#{n}word" }
  end
end
