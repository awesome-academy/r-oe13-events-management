class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :avatar
      t.string :address
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
