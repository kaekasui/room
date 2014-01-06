class AddProjectIdToTicketCategories < ActiveRecord::Migration
  def change
    add_column :ticket_categories, :project_id, :integer
  end
end
