class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :user_id, foreign_key: true
      t.integer :admin_id, foreign_key: true
      t.integer :chat_room_id
      t.string :message
      t.boolean :is_admin_send, default: false, null: false
      t.integer :solution_status


      t.timestamps
    end
  end
end
