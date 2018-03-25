class PastMealNutritionalUpdate < ActiveRecord::Migration[5.1]
  def change
    add_column :past_meals, :NA, :float
    add_column :past_meals, :CHLOE, :float
    add_column :past_meals, :FATRN, :float
    add_column :past_meals, :FASAT, :float
    add_column :past_meals, :CHOCDF, :float
    add_column :past_meals, :FIBTG, :float
    add_column :past_meals, :PROCNT, :float
    add_column :past_meals, :VITC, :float
    add_column :past_meals, :CA, :float
    add_column :past_meals, :FE, :float
    add_column :past_meals, :SUGAR, :float
    add_column :past_meals, :ENERC_KCAL, :float
    add_column :past_meals, :FAT, :float
    add_column :past_meals, :VITA_IU, :float




    add_column :nutritional_data, :cholesteral, :float
    add_column :nutritional_data, :fatty_acid, :float
    add_column :nutritional_data, :s_fatty_acid, :float
    add_column :nutritional_data, :carbs, :float
    add_column :nutritional_data, :sugar, :float
    add_column :nutritional_data, :fat, :float


  end
end
