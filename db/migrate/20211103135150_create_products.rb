class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.date :release_date, null: false
      t.string :poster_url
      t.string :spotify_id
      t.string :record_type, null: false

      t.timestamps
    end
  end
end
