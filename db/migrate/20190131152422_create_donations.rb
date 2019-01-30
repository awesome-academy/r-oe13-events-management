class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :event, foreign_key: true
      t.string :donors_name
      t.string :type
      t.text :description
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
