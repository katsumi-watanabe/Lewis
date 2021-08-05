class CreatePostSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :post_sneakers do |t|
      t.integer :user_id
      t.string :sneakers_name
      t.string :post_sneakers_image
      t.integer :gender_selection
      t.text :caption

      t.timestamps
    end
  end
end
