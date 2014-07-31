class ChangeUserTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :blurb
    end
  end
end
