class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.date :release_date, null: false
      t.string :poster_url
      t.string :spotify_id
      t.string :type, null: false

      t.timestamps
    end
  end
end
