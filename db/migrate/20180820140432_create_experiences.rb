class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :content
      t.string :link_to_album
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
