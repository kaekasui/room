class AddCreatedByAndUpdatedByToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :created_by, :integer
    add_column :blog_comments, :updated_by, :integer
  end
end
