class UsersChange < ActiveRecord::Migration
  def up
    rename_column :users, :password, :password_digest
    remove_column :users, :salt
  end

  def down
    rename_column :users, :password_digest, :password
    add_column :users, :salt, :string
  end
end
