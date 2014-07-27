class AddScoreToImagesAndComments < ActiveRecord::Migration
  def change
    add_column :images, :score, :integer, default: 0
    add_column :comments, :score, :integer, default: 0
  end
end
