class CreateCategoryProductAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :category_product_assignments do |t|
      t.bigint :product_id, null: false
      t.bigint :category_id, null: false
      t.bigint :sort_number
      t.timestamps

      t.index %i[product_id category_id], unique: true
    end
  end
end
