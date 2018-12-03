class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :text
    add_column :users, :username, :string
  end
end
