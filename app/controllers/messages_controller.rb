class MessagesController < ApplicationController
  def show
  end

  def create

   @message = Message.new
   @message.user_id = params[:message][:id]
   @message.username = params[:message][:username]
   @message.email = params[:message][:email]
   @message.body = params[:message][:body]
   @message.save

   if @message.save
     MemberMailer.direct_email(current_user, @message).deliver
   end

   @message.destroy

   redirect_to root_path
  end

end
