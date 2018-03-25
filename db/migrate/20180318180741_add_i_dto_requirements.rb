class AddIDtoRequirements < ActiveRecord::Migration[5.1]
  def change
      add_column :requirements, :yummly_id, :integer
  end
end
