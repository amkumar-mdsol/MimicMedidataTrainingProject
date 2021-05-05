class AddStudyGroupIdToStudy < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :study_group_id, :integer
  end
end
