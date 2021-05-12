class AddBloodGroupToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :blood_group, :string, default: ''
  end
end
