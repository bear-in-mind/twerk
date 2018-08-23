class RemoveAcceptedFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :accepted, :datetime
  end
end
