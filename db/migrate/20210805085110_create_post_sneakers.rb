class CreatePostSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :post_sneakers do |t|
      t.integer :user_id, foreign_key: true, null: false
      t.string :sneakers_name
      t.string :post_image_id
      t.integer :gender_selection
      t.text :caption

      t.timestamps
    end
  end
end
