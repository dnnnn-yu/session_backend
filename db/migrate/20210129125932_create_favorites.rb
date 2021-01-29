class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :member, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
    end
    add_index :favorites, [:member_id, :post_id], unique: true
  end
end
