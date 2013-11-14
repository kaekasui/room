class AddOmniToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer, limit: 8
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :screen_name, :string
    add_column :users, :password, :string
  end
end
