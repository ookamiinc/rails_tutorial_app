class MessagesController < ApplicationController
  def index
    @message = Message.new
    @user = User.find(params[:id])
    @messages = Message.dm(current_user.id,@user.id)
  end

  def create
    user = current_user
    message = user.sending.build(user_id:params[:id])
    if message.save
      redirect_to root_url
    end
  end

end
