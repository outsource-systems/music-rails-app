class CreateCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :creators do |t|
      t.string :name, null: false
      t.text :description
      t.string :poster_url
      t.string :spotify_id
      t.string :type, null: false
      
      t.timestamps
    end
  end
end
