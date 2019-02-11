class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :latitude
      t.string :longitude
      t.string :address

      t.timestamps
    end
  end
end
