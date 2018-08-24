class AddPaidToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :paid, :boolean, default: false
  end
end
