class AddNickToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    remove_column :users, :username
  end
end
