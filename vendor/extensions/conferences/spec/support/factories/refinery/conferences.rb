
FactoryGirl.define do
  factory :conference, :class => Refinery::Conferences::Conference do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

