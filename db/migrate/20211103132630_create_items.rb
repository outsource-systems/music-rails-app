class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.time :time, null: false
      t.string :poster_url
      t.string :url, null: false
      t.string :spotify_id
      t.string :type, null: false
      t.bigint :product_id
      t.integer :sort_number, null: false

      t.timestamps
    end
  end
end