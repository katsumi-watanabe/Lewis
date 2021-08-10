class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_sneaker_id, foreign_key: true, null: false, index: true
      t.integer :user_id, foreign_key: true, null: false
      t.string :comment

      t.timestamps
    end
  end
end
