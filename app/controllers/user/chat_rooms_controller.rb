class User::ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  
  def update
    @chat_room = ChatRoom.find(params[:id])
    @chat = @chat_room.chats
    @chat_room.update(solution_status: 1)
    redirect_to chat_path(@chat)
  end
end
