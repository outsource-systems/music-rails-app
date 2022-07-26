class CreateUserItemFavoriteAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_item_favorite_assignments do |t|
      t.bigint :item_id, null: false
      t.bigint :user_id, null: false
      t.timestamps

      t.index %i[item_id user_id], unique: true
    end
  end
end
