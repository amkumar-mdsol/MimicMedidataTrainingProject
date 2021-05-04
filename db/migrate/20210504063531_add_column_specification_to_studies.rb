class AddColumnSpecificationToStudies < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :specification, :string
  end
end
