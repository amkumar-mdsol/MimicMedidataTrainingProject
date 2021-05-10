class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject

  after_save :audit_log

  def audit_log
  	Rails.logger.info "**************inside audit log************"
  	AuditJob.perform_later self  #queue
  end
end


# stu = Study.first
# sub4 = Subject.find 4
# Enrollment.create(subject: sub4, study: stu)

#diff btw perform_now and later