class AddFinishedToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :finished, :boolean
  end
end
