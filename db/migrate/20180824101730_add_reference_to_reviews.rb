class AddReferenceToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :job, foreign_key: true
  end
end
