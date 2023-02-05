class RemoveEmailAndNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :string
    remove_column :users, :name, :string
  end
end
