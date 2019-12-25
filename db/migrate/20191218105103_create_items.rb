class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price 
      t.text :description
      
      t.boolean :deleted_at, null :false

      t.string :image_id

      t.timestamps
    end
  end
end
