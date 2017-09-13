class MemberMailer < ApplicationMailer
  default from: 'from@example.com'

  def member_email(user, group)
    @user = user
    @group = group
    mail( :to => @user.email, :subject => "団体に申請しました" )
  end
end
