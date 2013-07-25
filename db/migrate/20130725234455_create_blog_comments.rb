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
      t.boolean :admin, default: false
      t.boolean :mixi, default: false
      t.boolean :draft, default: false

      t.timestamps
    end
  end
end
