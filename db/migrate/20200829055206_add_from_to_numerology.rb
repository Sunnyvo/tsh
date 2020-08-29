class AddFromToNumerology < ActiveRecord::Migration[6.0]
  def change
    add_column :numerologies, :from, :string
  end
end
