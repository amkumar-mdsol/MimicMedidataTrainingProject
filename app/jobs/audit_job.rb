class AuditJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	 # Do something later
    Rails.logger.info "=====================>We have logged an enrollment  #{args} =====#{args.class}"

    enrollment = args[0]  #enrollment object
    study_name, subject_name = enrollment.study.name, enrollment.subject.name

  	file = File.join(File.dirname(__FILE__), 'audit.txt')
	File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name}" }

    # Do something later
  end
end
