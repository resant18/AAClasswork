class RemoveColumnsInPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id, :user_id    
  end
end
