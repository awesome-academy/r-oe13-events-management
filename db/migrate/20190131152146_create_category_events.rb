class CreateCategoryEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :category_events do |t|
      t.references :category, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
