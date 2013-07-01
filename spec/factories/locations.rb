# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence (:street_address) { |n| "Stre#{n}et Ave" }
    sequence (:city) { |n| "Ci#{n}ty" }
    sequence (:state) { |n| "St#{n}ate" }
    sequence (:zip) { |n| "Zi#{n}p" }
  end
end
