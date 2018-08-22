class AddMainJobToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :main_job, :string
  end
end
