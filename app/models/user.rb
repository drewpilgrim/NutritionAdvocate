class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :past_meals
  has_many :user_requirements
  has_many :recipes
  has_many :requirements, through: :user_requirements



  def logged_in
    if current_user
      return true
    else
      return false
    end
  end

  def email_proper_format
    if !(email.include? "@")
      errors.add(:email, "Not in proper format")
    end
  end

  def as_json
    {
      id: id,
      username: username,
      email: email,
      age: age,
      gender: gender,
      requirements: requirements.as_json,
      past_meals: past_meals.as_json,
      recipes: recipes.as_json
    }
  end


end
