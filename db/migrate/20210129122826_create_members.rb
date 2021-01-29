class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.string     :name, null: false
      t.column     :gender, "enum('male', 'female')", index: true
      t.string     :image
      t.date       :birthday, index: true
      t.text       :profile
      t.references :prefecture, foreign_key: true
      t.string     :portfolio_url
      t.string     :twitter_id
      t.string     :instagram_id
      t.timestamps
    end
  end
end
