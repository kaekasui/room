class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :registrable_id
      t.string :registrable_type
      t.integer :category_id

      t.timestamps
    end
  end
end
