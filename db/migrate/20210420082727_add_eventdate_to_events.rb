class AddEventdateToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :eventdate, :date
  end
end
