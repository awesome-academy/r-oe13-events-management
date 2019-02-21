class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.references :place, foreign_key: true
      t.integer :create_by
      t.string :banner
      t.boolean :status, default: "false"

      t.timestamps
    end
  end
end
