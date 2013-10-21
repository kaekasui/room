class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :position
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
