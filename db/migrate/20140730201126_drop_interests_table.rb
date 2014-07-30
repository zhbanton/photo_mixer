class DropInterestsTable < ActiveRecord::Migration

  def up
    drop_table :interests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
