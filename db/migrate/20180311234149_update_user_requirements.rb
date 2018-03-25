class UpdateUserRequirements < ActiveRecord::Migration[5.1]
  def change
    remove_column :requirements, :user_id, :integer
    remove_column :user_requirements, :tag, :string
  end
end
