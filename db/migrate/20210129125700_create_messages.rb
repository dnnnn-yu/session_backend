class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :send_member, foreign_key: { to_table: :members }, null: false
      t.references :recieve_member, foreign_key: { to_table: :members }, null: false
      t.text       :content
    end
  end
end
