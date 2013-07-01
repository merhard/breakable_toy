# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :court do
    sequence (:number_of) { |n| "#{n}" }
    association :location
    association :sport
  end
end
