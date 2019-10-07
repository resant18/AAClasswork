class RemoveColumnInSubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :user_id
  end
end
