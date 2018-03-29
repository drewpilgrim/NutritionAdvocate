class Requirement < ApplicationRecord
  has_many :user_requirement
  has_many :users, through: :user_requirements

    def as_json
      {
        id: id,
        name: name,
        tag: tag,
        yummly_search:yummly_search,
        display: display
      }
  end

  def display
    str = name
    if (tag == "allergy")
      str = str +  " " + "Allergy"
    end
    if (tag == "diet")
      str = str + " " + "Diet"
    end
    if (tag == "mealType")
      str = str + " " + "Meal Type"
    end

    return str
  end
end


