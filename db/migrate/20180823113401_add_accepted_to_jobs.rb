class AddAcceptedToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :accepted, :boolean
  end
end
