class AddForeinkeyToEmailTemplate < ActiveRecord::Migration[6.0]
  def change
    add_reference :email_templates, :user, foreign_key: true
  end
end
