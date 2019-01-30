class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :place, foreign_key: true
      t.integer :create_by
      t.string :banner
      t.boolean :status

      t.timestamps
    end
  end
end
