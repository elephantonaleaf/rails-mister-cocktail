class AddPhotoToCocktail < ActiveRecord::Migration[4.2]
  def change
    add_column :cocktails, :photo, :string
  end
end
