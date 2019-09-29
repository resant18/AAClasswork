class RemoveEmailColumnAndAddUniqToUsername < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :email
    end

    add_index :users, :username, unique: true
  end
end
