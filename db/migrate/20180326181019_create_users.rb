class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :location_id
      t.string :email
      t.integer :age
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
