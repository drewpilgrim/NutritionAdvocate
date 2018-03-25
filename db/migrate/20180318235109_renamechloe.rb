class Renamechloe < ActiveRecord::Migration[5.1]
  def change
    remove_column :past_meals, :CHLOE, :float
    add_column :past_meals, :CHOLE, :float
  end
end
