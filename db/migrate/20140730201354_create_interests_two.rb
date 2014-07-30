class CreateInterestsTwo < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
