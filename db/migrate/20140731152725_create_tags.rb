class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :image, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
