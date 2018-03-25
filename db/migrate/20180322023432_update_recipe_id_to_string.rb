class UpdateRecipeIdToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :yumID, :integer
    add_column :recipes, :yumID, :string
  end
end
