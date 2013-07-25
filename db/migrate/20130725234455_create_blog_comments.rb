class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id
      t.string :title
      t.string :author
      t.text :content
      t.string :url
      t.string :mail
      t.string :ip
      t.string :host
      t.string :password
      t.string :salt
      t.boolean :admin
      t.boolean :mixi
      t.boolean :draft

      t.timestamps
    end
  end
end
