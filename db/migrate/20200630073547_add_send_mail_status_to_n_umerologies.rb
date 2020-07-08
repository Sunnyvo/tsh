class AddSendMailStatusToNUmerologies < ActiveRecord::Migration[6.0]
  def change
    add_column :numerologies, :sent_demo, :boolean, default: false
    add_column :numerologies, :sent_full, :boolean, default: false
  end
end
