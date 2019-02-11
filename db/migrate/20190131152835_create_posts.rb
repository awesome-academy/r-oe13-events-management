class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.text :title
      t.references :event, foreign_key: true
      t.string :thumbnail

      t.timestamps
    end
  end
end
