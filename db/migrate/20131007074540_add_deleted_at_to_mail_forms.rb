class AddDeletedAtToMailForms < ActiveRecord::Migration
  def change
    add_column :mail_forms, :deleted_at, :timestamp
  end
end
