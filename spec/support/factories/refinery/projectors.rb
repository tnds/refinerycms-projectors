
FactoryGirl.define do
  factory :projector, :class => Refinery::Projectors::Projector do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

