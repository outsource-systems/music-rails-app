class CreateItemCreatorAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_creator_assignments do |t|
      t.bigint :item_id, null: false
      t.bigint :creator_id, null: false
      t.timestamps

      t.index %i[item_id creator_id], unique: true
    end
  end
end
