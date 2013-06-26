# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sport do
    sequence (:name) { |n| "Spo#{n}rt Name" }
  end
end
