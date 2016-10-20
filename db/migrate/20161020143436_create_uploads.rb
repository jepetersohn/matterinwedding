class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :link, null: false
      t.string :description, null: false
      t.integer :poster_id
      t.integer :width
      t.integer :height

      t.timestamps(null: false)
    end
  end
end
