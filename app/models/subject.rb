class Subject < ApplicationRecord
	has_one :address,  as: :addressable
	#has_and_belongs_to_many :studies

	validates :blood_group, presence: true, inclusion: { in: ['b+', 'a+', 'b-', 'o-'] }
	
	has_many :enrollments
  	has_many :studies , through: :enrollments
end
