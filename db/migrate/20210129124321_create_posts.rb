class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :member, foreign_key: true, null: false
      t.string     :type
      t.string     :title
      t.text       :content
      t.references :part, foreign_key: true
      t.integer    :age_min, index: true
      t.integer    :age_max, index: true
      t.references :prefecture, foreign_key: true, null: false
      t.column     :gender, "enum('male', 'female')", index: true
      t.string     :portfolio_url
      t.date       :work_on, index: true
      t.timestamps
    end
  end
end
