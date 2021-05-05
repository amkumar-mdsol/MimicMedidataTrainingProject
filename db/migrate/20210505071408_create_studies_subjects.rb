class CreateStudiesSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :studies_subjects do |t|
      t.integer :subject_id
      t.integer :study_id

      t.timestamps
    end
  end
end
