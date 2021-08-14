class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.integer :user_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
