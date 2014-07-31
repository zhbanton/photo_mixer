class DropTagsTable < ActiveRecord::Migration

  def up
    drop_table :tags
    drop_table :taggings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
    raise ActiveRecord::IrreversibleMigration
  end

end
