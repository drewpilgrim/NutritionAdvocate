class CreatePastMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :past_meals do |t|
      t.string :name

      t.timestamps
    end
  end
end
