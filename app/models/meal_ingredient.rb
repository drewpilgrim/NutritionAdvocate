class MealIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :past_meal
end
