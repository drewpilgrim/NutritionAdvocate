class CreateNutritionalData < ActiveRecord::Migration[5.1]
  def change
    create_table :nutritional_data do |t|
      t.integer :age
      t.string :gender
      t.float :exercise
      t.float :protein
      t.float :fibre
      t.float :vitamin_a
      t.float :thiamin
      t.float :riboflavin
      t.float :niacin
      t.float :vitamin_b6
      t.float :vitamin_b12
      t.float :folate
      t.float :vitamin_c
      t.float :calcium
      t.float :iodine
      t.float :iron
      t.float :magnesium
      t.float :potassium
      t.float :sodium
      t.float :zinc
      t.float :calories

      t.timestamps
    end
  end
end
