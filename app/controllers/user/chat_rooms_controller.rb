class User::ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def update
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.update(solution_status: 1)
    @chat = @chat_room.chats.build
  end
end
