class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :price, default: 0
      t.boolean :completed, default: false
      t.references :user, foreign_key: true
      t.references :talent, foreign_key: true

      t.timestamps
    end
  end
end
