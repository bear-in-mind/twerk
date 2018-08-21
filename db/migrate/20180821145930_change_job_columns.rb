class ChangeJobColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :completed
    add_column :jobs, :accepted, :timestamp, default: nil
    add_column :jobs, :completed, :timestamp, default: nil
    add_column :jobs, :audio_file, :string
  end
end
