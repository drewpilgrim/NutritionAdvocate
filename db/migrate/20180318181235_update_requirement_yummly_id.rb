class UpdateRequirementYummlyId < ActiveRecord::Migration[5.1]
  def change
    remove_column :requirements, :yummly_id, :integer
    add_column :requirements, :yummly_search, :string
  end
end
