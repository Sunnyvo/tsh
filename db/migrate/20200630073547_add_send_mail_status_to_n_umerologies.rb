class AddSendMailStatusToNUmerologies < ActiveRecord::Migration[6.0]
  def change
    add_column :numerologies, :sent_mail, :boolean, default: false
  end
end
