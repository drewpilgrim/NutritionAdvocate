class Updatekeysndata < ActiveRecord::Migration[5.1]
  def change
    rename_column :nutritional_data, :sodium, :na
    rename_column :nutritional_data, :fatty_acid, :fatrn
    rename_column :nutritional_data, :s_fatty_acid, :fasat
    rename_column :nutritional_data, :carbs, :chocdf
    rename_column :nutritional_data, :fibre, :fibtg
    rename_column :nutritional_data, :protein, :procnt
    rename_column :nutritional_data, :vitamin_c, :vitc
    rename_column :nutritional_data, :calcium, :ca
    rename_column :nutritional_data, :iron, :fe
    rename_column :nutritional_data, :calories, :enerc_kcal
    rename_column :nutritional_data, :vitamin_a, :vita_iu
    rename_column :nutritional_data, :potassium, :k
    rename_column :nutritional_data, :cholesteral, :chole

  end
end
