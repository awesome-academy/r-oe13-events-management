class CreateEventPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :event_places do |t|
      t.references :event, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
