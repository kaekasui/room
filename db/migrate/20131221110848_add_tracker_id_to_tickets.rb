class AddTrackerIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :tracker_id, :integer
  end
end
