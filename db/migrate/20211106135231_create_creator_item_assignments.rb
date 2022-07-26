class CreateCreatorItemAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :creator_item_assignments do |t|
      t.bigint :creator_id, null: false
      t.bigint :item_id, null: false

      t.timestamps
      t.index %i[creator_id item_id], unique: true
    end
  end
end
