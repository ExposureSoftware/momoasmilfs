class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.string :htmlTitle
      t.string :url
      t.string :contextUrl

      t.timestamps
    end
  end
end
