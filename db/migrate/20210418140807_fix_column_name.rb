class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :Name, :name
  end
end
