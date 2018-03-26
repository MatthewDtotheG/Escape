class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :rent_start
      t.datetime :rent_end
      t.integer :item_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
