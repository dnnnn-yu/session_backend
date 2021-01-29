class CreateMemberParts < ActiveRecord::Migration[6.0]
  def change
    create_table :member_parts do |t|
      t.references :member, foreign_key: true, null: false
      t.references :part, foreign_key: true, null: false
    end
    add_index :member_parts, [:member_id, :part_id], unique: true
  end
end
