class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :parent_comment_id, null: false
      t.text :content, null: false
      t.integer :author_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
    add_index :comments, :parent_comment_id
    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end
