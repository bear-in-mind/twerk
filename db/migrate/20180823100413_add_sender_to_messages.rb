class AddSenderToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sender, :string
  end
end
