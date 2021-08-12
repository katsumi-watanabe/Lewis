class User::ChatsController < ApplicationController
  before_action :authenticate_user!

  def show
    chat_room = current_user.chat_rooms.find_or_create_by!(user: current_user)
    @chats = chat_room.chats.includes(:user)
    @chat = Chat.new(chat_room_id: chat_room.id)
  end

  def create
    @chat = current_user.chats.create(chat_params)
    @chats = @chat.chat_room.chats
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :chat_room_id)
  end
end
