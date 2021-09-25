class MessagesController < ApplicationController

  def create 
    message = Message.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id], text: params[:message])
    ActionCable.server.broadcast("hypothetical_channel", message: message)
    SendMessageJob.perform_later(message)
    redirect_back(fallback_location: "/admins_path")
  end 

end
