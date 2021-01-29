class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string  :name, index: { unique: true }, null: false
      t.integer :show_order, null: false
    end
  end
end
