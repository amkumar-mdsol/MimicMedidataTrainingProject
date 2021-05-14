FactoryBot.define do
  factory :subject do
    name { 'pqr' }
    age { rand(20..80) }
    blood_group { 'a+' }
  end
end