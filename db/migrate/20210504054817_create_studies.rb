class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :name, default: ""
      t.integer :age_limit
      t.string  :drug
      t.integer :phase, default: 0
      t.string  :symptoms

      t.timestamps
    end
  end
end

# Add validations on Study
# age_limit > 7
# drug should be present
# phase can't be greater than 5
