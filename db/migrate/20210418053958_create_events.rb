class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :Name
      t.timestamps
      t.belongs_to :user
    end
  end
end
