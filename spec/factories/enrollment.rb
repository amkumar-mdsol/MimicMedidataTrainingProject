FactoryBot.define do
  factory :enrollment do
    association :study
    association :subject
  end
end