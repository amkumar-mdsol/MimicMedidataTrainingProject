class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject

  after_save :audit

  def audit
  	Rails.logger.info "**************inside audit log************"
  	#AuditJob.perform_later self  #queue
    #enrollment = args[0]  #enrollment object
    study_name, subject_name = study.name, subject.name

  	file = File.join(File.dirname(__FILE__), 'audit.txt')
	File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name}" }
  end
  handle_asynchronously :audit

end

#diff btw perform_now and later


  # Delayed::Backend::ActiveRecord::Job Create (2.1ms)  INSERT INTO "delayed_jobs" 
  # ("handler", "run_at", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  
  # [["handler", "--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Enrollment\n  concise_attributes:\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    name: id\n    
  # 	value_before_type_cast: 52\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    
  # 	name: study_id\n    value_before_type_cast: 1\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n   
  # 	 name: subject_id\n    value_before_type_cast: 4\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n    
  # 	 name: created_at\n    value_before_type_cast: !ruby/object:ActiveSupport::TimeWithZone\n      
  # 	 utc: &1 2021-05-10 07:28:59.773334000 Z\n      zone: &2 !ruby/object:ActiveSupport::TimeZone\n    
  # 	     name: Etc/UTC\n      time: 2021-05-10 07:28:59.773334000 Z\n  - !ruby/object:ActiveModel::Attribute::FromDatabase\n  
  # 	       name: updated_at\n    value_before_type_cast: !ruby/object:ActiveSupport::TimeWithZone\n      utc: *1\n      
  # 	       zone: *2\n      time: 2021-05-10 07:28:59.773334000 Z\n  new_record: false\n  active_record_yaml_version: 
  # 	       2\nmethod_name: :audit_log_without_delay\nargs: []\n"],
  # 	        ["run_at", "2021-05-10 07:28:59.787303"], 

  # 	        ["created_at", "2021-05-10 07:28:59.787378"], ["updated_at", "2021-05-10 07:28:59.787378"]]