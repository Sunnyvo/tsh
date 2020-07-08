class AddNewMatchingToNumerology < ActiveRecord::Migration[6.0]
  def change
    add_column :numerologies, :name2, :string
    add_column :numerologies, :day_of_birth2, :string
  end
end
