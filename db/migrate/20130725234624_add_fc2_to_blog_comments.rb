class AddFc2ToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :fc2, :boolean, default: false
  end
end
