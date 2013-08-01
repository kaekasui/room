class CreateMailForms < ActiveRecord::Migration
  def change
    create_table :mail_forms do |t|

      t.timestamps
    end
  end
end
