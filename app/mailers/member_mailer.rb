class MemberMailer < ApplicationMailer
  default from: 'from@example.com'

  def apply_email(user, group)
    @user = user
    @group = group
    mail( :to => @user.email, :subject => "団体に申請しました" )
  end

  def applied_email(user, group, master)
    @user = user
    @group = group
    @master = master
    mail( :to => @master.email, :subject => "#{@user.username}さんから申請を受けました" )
  end
end
