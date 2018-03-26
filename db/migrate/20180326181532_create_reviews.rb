class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :buyer_id
      t.integer :reservation_id
      t.timestamps
    end
  end
end
