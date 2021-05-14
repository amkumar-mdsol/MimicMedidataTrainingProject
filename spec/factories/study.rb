FactoryBot.define do
  factory :study do
    name { 'my_study' }
    age_limit { rand(10..100) }
    drug { 'new_drug' }
    phase { 0 }
    symptoms { 'fever, cough' }
    blood_group { ['a+', 'a-', 'b+'] }
    
    association :study_group
  end
end
