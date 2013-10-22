class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :code
      t.string :title
      t.text :content
      t.integer :progress
      t.integer :status_id
      t.integer :priority_id
      t.integer :version_id
      t.integer :user_id
      t.integer :created_by
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
