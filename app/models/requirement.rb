class Requirement < ApplicationRecord
  has_many :user_requirement
  has_many :users, through: :user_requirements

    def as_json
      {
        id: id,
        name: name,
        tag: tag,
        yummly_search:yummly_search
      }
  end
end


