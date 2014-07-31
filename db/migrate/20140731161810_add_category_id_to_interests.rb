class AddCategoryIdToInterests < ActiveRecord::Migration
  def change
    change_table :interests do |t|
      t.remove :tag_id
      t.references :category, index: true
    end
  end
end
