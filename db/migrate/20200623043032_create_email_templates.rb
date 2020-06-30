class CreateEmailTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :subject
      t.text :plain_content
      t.text :html_content
      t.string :category, default: 'GENERAL'
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
