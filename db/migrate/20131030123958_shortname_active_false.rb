class ShortnameActiveFalse < ActiveRecord::Migration
  def up
    change_column_default :units, :active, false
    add_column :units, :shortname, :string
    add_column :units, :user_id, :integer
    add_column :units, :district_id, :integer
  end

  def down
    change_column_default :units, :active, nil
  end
end
