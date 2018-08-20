class CreateTalents < ActiveRecord::Migration[5.2]
  def change
    create_table :talents do |t|
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
