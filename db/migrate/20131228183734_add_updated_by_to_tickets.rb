class AddUpdatedByToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :updated_by, :integer
  end
end
