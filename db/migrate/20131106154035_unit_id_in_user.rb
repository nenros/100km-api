class UnitIdInUser < ActiveRecord::Migration
  def up
    add_column :users, :unit_id, :integer
  end

  def down
  end
end
