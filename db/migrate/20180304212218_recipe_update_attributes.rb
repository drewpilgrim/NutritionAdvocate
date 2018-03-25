class RecipeUpdateAttributes < ActiveRecord::Migration[5.1]
  def change
    # Recipe Updates
    add_column :recipes, :user_id, :integer
    add_column :recipes, :description, :text
    add_column :recipes, :yumID, :integer
    add_column :recipes, :ingredients, :string
    add_column :recipes, :image_url, :text
    add_column :recipes, :source_url, :text


    # Past Meal Updates
    add_column :past_meals, :user_id, :integer
    add_column :past_meals, :description, :text, :default => "A meal"


  end
end
