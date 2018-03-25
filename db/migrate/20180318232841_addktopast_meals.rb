class AddktopastMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :past_meals, :K, :float
  end
end
