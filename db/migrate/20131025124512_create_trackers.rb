class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :name
      t.integer :position
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
