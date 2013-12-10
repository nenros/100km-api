class UnitIdInEvent < ActiveRecord::Migration
  def up
    add_column :events, :unit_id, :integer
  end

  def down
  end
end
