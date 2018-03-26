class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :price
      t.integer :seller_id

      t.timestamps
    end
  end
end
