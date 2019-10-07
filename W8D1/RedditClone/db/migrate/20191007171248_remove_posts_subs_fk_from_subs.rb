class RemovePostsSubsFkFromSubs < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:posts, :subs)
      remove_foreign_key :posts, :subs
    end
  end
end
