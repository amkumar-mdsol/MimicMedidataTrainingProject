class AddColumnInStudies < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :verified, :boolean
  end
end