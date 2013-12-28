class CreateTicketCategoryCases < ActiveRecord::Migration
  def change
    create_table :ticket_category_cases do |t|
      t.integer :ticket_id
      t.integer :ticket_category_id

      t.timestamps
    end
  end
end
