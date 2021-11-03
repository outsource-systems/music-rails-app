class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.time :time, null: false
      t.string :poster_url
      t.string :url, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end