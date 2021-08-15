class User::ChatsController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   chat_room = current_user.chat_rooms.find_or_create_by!(user: current_user)
  #   redirect_to chat_room_path(chat_room)
  # end
  def show
    user_chat_room = current_user.chat_room
    chat_room = nil
    if user_chat_room.nil?
      chat_room = ChatRoom.create(user_id: current_user.id)
    else
      chat_room = user_chat_room
    end
    @chats = chat_room.chats.includes(:user)
    @chat = Chat.new(chat_room_id: chat_room.id)
  end

   def create
    @chat = current_user.chats.create(chat_params)
    @chats = @chat.chat_room.chats
    redirect_to chat_path(@chat)
   end

  def edit
  end

  def update
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.user_id = current_user.id
    @post_sneaker.destroy
    @chats = Chat.all
    @chat.delete
    redirect_to chat_path(@chat)
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :chat_room_id, :is_admin_send)
  end
end
