class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub, null: false
      t.integer :author, null: false

      t.timestamps
    end
    add_index :posts, :sub
    add_index :posts, :author
    add_reference :posts, :sub, foreign_key: true
    add_reference :posts, :user, foreign_key: true
  end
end
