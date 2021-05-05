class StudyGroup < ApplicationRecord
	has_many :studies   #dynamically gives you these methods
	has_many :sites, through: :studies 
end


#has_many(:studies)
# studies << study_object
# StudyGroup has a method :studies


# collection<<(object, ...)

