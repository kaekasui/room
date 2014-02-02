class AddMainToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :main, :boolean
  end
end
