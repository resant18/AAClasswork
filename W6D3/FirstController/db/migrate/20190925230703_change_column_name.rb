class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :name, :username
    end
  end
end
