class RemoveObjectFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :object, :string
  end
end
