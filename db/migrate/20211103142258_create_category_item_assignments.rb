class CreateCategoryItemAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :category_item_assignments do |t|
      t.bigint :item_id, null: false
      t.bigint :category_id, null: false
      t.timestamps

      t.index %i[item_id category_id], unique: true
    end
  end
end
