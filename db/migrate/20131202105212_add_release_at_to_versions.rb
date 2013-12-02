class AddReleaseAtToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :release_at, :timestamp
  end
end
