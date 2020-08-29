class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string, default: "n"
    add_column :users, :point, :integer
  end
end
