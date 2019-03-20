class CreateThumbnails < ActiveRecord::Migration[5.2]
  def change
    create_table :thumbnails do |t|
      t.integer :image_id
      t.string :url
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end
end
