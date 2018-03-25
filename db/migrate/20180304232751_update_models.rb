class UpdateModels < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :ingredients
    remove_column :recipes, :source_url 

    create_table :requirements do |t|
      t.string :name
      t.string :user_id
      t.string :tag

      t.timestamps
    end

    create_table :ingredients do |t|
      t.string :name
      t.string :tag
      t.integer :quantity
      t.string :description
      t.string :value
      t.string :unit
      t.timestamps
    end


    create_table :user_requirements do |t|
      t.string :name
      t.string :user_id
      t.string :tag
      
      t.timestamps
    end

    create_table :meal_ingredients do |t|
      t.string :meal_id
      t.string :ingredient_id
      
      t.timestamps
    end

  end
end
