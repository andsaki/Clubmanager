class MessagesController < ApplicationController
  before_action :authenticate_user!

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
      @message.destroy
      redirect_to "/users/#{@message.user_id}", flash: {message: "メッセージを送信しました"}
    else
      redirect_to "/users/#{@message.user_id}", flash: {message_error: "メッセージを入力して下さい"}
    end

  end

end
