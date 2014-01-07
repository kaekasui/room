class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :project_id
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
