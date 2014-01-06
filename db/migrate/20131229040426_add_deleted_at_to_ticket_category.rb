class AddDeletedAtToTicketCategory < ActiveRecord::Migration
  def change
    add_column :ticket_categories, :deleted_at, :timestamp
  end
end
