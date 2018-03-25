class PastMeal < ApplicationRecord
  belongs_to :user
  
  # def shorthand
  #   {
  #     name: name,
  #   }
  # end

  def as_json
    {
      name: name,
      na: na,
      fatrn: fatrn,
      fasat: fasat,
      chocdf: chocdf,
      fibtg: fibtg,
      procnt: procnt,
      vitc: vitc,
      ca: ca,
      fe: fe,
      sugar: sugar,
      enerc_kcal: enerc_kcal,
      fat: fat,
      vita_iu: vita_iu,
      k: k, 
      chole: chole
    }
  end
end
