class CreatePrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.string :name, null: false
      t.references :area, foreign_key: true, null: false
    end
  end
end
