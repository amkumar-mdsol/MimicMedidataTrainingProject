# Study model
class Study < ApplicationRecord
  validates :name, :drug, presence: true
  validates :age_limit, numericality: { greater_than: 7 }
  validates :phase, numericality: { less_than: 5 }
  after_save :send_email

  belongs_to :study_group, optional: true
  has_many :sites

  has_many :enrollments
  has_many :subjects , through: :enrollments

  has_one_attached :my_image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

  # scope :usable_drugs, -> { where("phase >= 4") }
  scope :under_trials, -> { where("phase < 4") }

  def self.usable_drugs
    where("phase >= 4")
  end

  private

  def send_email
    StudyMailer.with( study: @study ).success_email.deliver_later
  end
end


# Scenario -> 

# Subject enrolls to a study (whenever an enrollment is created) , we will put that in our file system. for eg a log

# Study has_many subjects through Enrollment

# STUDY   ENROLLMENT  SUBJECT

# id 		study_id (1)
# 		subject_id(2)    id

# 		study_id(1)
# 		subject_id(3)



# model name is singular, and the relation name pertaining to it in the database
# is plural.
#add another migration for study_group_id


# Address Table      subject Table
# pune maharas 1	  1  Neelima 30




#has_many_through

# Studygroup study1  site1 (study_id)
# 					 site2

# 			 study2  site3
# 			 		 site2	



# #has_and_belongs_to_many 

# neelima -> diabetes
# 		   tension
# 		  


# Subject has_and_belongs_to_many studies

#studies_subjects
# subject_id
# study_id


#polymorphic association

# Address  address_type: subject/site , address_id -> subject_id/site_id , address: "ssdffbfdsasdf"

# Subject can have an Address
# Site can have a address

