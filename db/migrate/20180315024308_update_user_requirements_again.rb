class UpdateUserRequirementsAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_requirements, :name, :string
    add_column :user_requirements, :requirement_id, :integer
  end
end
