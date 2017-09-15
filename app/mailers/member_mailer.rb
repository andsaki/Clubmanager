class MemberMailer < ApplicationMailer
  default from: 'from@example.com'

  #申請メール
  def apply_email(user, group)
    @user = user
    @group = group
    mail( :to => @user.email, :subject => "#{@group.name}に参加の申請をしました" )
  end

  def applied_email(user, group, master)
    @user = user
    @group = group
    @master = master
    mail( :to => @master.email, :subject => "#{@user.username}さんから申請を受けました" )
  end

  #申請許可メール
  def approval_email(new_member, group)
    @new_member = new_member
    @group = group
    mail( :to => @new_member.email, :subject => "#{@group.name}から参加の許可が降りました")
  end

  #グループ退会メール
  def retire_email(member, group, master)
    @member = member
    @group = group
    @master = master
    mail( :to => @master.email, :subject => "#{@member.user_name}が退会しました")
  end

  #申請取り消しメール
  def no_approval_email(member, group)
    @member = member
    @group = group
    mail( :to => @member.email, :subject => "#{@group.name}から参加の申請が取り消されました")
  end

  #ダイレクトメッセージ
  def direct_email(user, message)
    @user = user
    @message = message
    mail( :to => @message.email, :submit => "#{user.username}からメッセージが届きました")
  end
end
