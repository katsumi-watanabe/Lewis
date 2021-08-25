class User::ChatsController < ApplicationController
  before_action :authenticate_user!

  # chat_roomがなければ作成、存在すれば表示
  def show
    user_chat_room = current_user.chat_room
    @chat_room = nil
    if user_chat_room.nil?
      @chat_room = ChatRoom.create(user_id: current_user.id)
    else
      @chat_room = user_chat_room
    end
    @chats = @chat_room.chats.includes(:user)
    @chat = Chat.new(chat_room_id: @chat_room.id)
  end

  def create
    @chat = current_user.chats.create(chat_params)
    @chats = @chat.chat_room.chats
    # chatがcreateされるとsolution_statusを未解決に設定
    unless @chat.save
      render 'error'
    end
    @chat_new = Chat.new(chat_room_id: chat_params[:chat_room_id])
    @chat.chat_room.update(solution_status: "未解決")
  end

  def edit
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.user_id = current_user.id
    @chats = @chat.chat_room.chats
    @chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :chat_room_id, :is_admin_send)
  end
end
