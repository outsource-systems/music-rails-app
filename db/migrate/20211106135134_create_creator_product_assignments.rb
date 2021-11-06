class CreateCreatorProductAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :creator_product_assignments do |t|
      t.bigint :creator_id, null: false
      t.bigint :product_id, null: false
      
      t.timestamps
      t.index %i[creator_id product_id], unique: true
    end
  end
end
