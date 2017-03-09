class RenameHashPasswordInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :hash_password, :hashed_password
  end
end
