class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :name
      t.integer :position
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
