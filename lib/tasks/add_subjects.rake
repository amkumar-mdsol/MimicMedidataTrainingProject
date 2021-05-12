# hello rake task
namespace :hello do
  desc 'Just a task to greet'
  task process: :environment do
    puts "Hello, My first rake task"
  end
end

# create a rake task to enroll given no of subjects to a study,
# Add 100 participant to a given study


namespace :add_subjects do
  desc 'Add given no of subjects to a study'
  task :process, [:study_name,:subject_count] => :environment do |t, args|
    study = Study.find_by_name(args[:study_name])
    abort('Study not found') unless study
    
    puts "Adding #{args[:subject_count].to_i} subjects to study: #{study.name}"

    args[:subject_count].to_i.times do |i|
      subject = Subject.new(
        name: Faker::Name.name,
        age: rand(study.age_limit..100),
        blood_group: Faker::Blood.group.downcase,
      )
      begin
        subject.save!
        puts "Adding subject with name: #{subject.name} to study: #{study.name}"
        Enrollment.create!(study: study, subject: subject)
      rescue => e
        puts "Unable to add subject due to: #{e}"
      end
    end
    puts "Added #{args[:subject_count]} subjects to study with name #{study.name}"
  end
end

