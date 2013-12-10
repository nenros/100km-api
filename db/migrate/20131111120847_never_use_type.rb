class NeverUseType < ActiveRecord::Migration
  def up
    rename_column :units, :type, :age
  end

  def down
  end
end
