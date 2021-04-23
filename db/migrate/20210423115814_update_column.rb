class UpdateColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :eventdate, :eventDate
  end
end
