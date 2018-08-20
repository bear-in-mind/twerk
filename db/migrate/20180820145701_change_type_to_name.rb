class ChangeTypeToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :talents, :type, :name
  end
end
