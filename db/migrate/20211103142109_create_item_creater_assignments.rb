class CreateItemCreaterAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_creater_assignments do |t|
      t.bigint :item_id, null: false
      t.bigint :creater_id, null: false
      t.timestamps

      t.index %i[item_id creater_id], unique: true
    end
  end
end
