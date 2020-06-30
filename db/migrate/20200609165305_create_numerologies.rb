class CreateNumerologies < ActiveRecord::Migration[6.0]
  def change
    create_table :numerologies do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.datetime :day_of_birth
      t.string :email
      t.string :phone
      t.string :address
      t.text :desire

      t.timestamps
    end
  end
end
