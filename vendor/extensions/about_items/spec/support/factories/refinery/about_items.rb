
FactoryGirl.define do
  factory :about_item, :class => Refinery::AboutItems::AboutItem do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

