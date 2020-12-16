class CreateNumContents < ActiveRecord::Migration[6.0]
  def change
    create_table :num_contents do |t|
      t.text :number
      t.string :subject
      t.text :content
      t.text :advise
      t.string :category, default: 'GENERAL'
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
