
FactoryGirl.define do
  factory :workshop, :class => Refinery::Workshops::Workshop do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

