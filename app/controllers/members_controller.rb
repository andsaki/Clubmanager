class MembersController < ApplicationController

  #ログイン者のみ表示
  before_action :authenticate_user!


  def index
  end

  def show
  end

  def delete
   @group = Group.where("id = ?", params[:group_id]).first
   @member = Member.where("id = ?", params[:user_id]).first
   @member.destroy

   #申請不許可メール
   @no_member = User.find(@member.user_id)
   if @member.destroy
     MemberMailer.no_approval_email(@no_member, @group).deliver
   end

   @g = Group.where("id = ?", current_user.state_group_id).first
   if @g.master_id != current_user.id then
     @user = User.where("id = ?", current_user.id).first
     @user.state_group_id = -1
     @user.save
     redirect_to root_path
   else
   redirect_to "/members/applicater/#{@group.id}"
   end

  end

  def retire
   @member = Member.where("user_id = ?", current_user.id).where("group_id = ?", current_user.state_group_id).first
   @member.destroy

   #退会メール
   @group = Group.find(@member.group_id)
   @master = User.find(@group.master_id)
   if @member.destroy
      MemberMailer.retire_email(@member, @group, @master).deliver
   end

   @user = User.where("id = ?", current_user.id).first
   @user.state_group_id = -1
   @user.save
   redirect_to root_path
  end

  def permit
   @group = Group.where("id = ?", params[:group_id]).first
   @member = Member.where("id = ?", params[:user_id]).first
   @member.p = 1
   @member.save

   #申請許可メール
   @new_member = User.find(@member.user_id)
   if @member.save
     MemberMailer.approval_email(@new_member, @group).deliver
   end

   redirect_to "/members/applicater/#{@group.id}"
  end

  def application
   @group_id = params[:id]
  end

  def applicate
   @member = Member.new
   @member.group_id = params[:id]
   @member.user_id = current_user.id
   @member.user_name = current_user.username
   @member.p = 0
   @member.save
   @group = Group.where("id = ?", params[:id]).first

   #申請メール
   @master = User.find(@group.master_id)
   if @member.save
     MemberMailer.apply_email(current_user, @group).deliver
     MemberMailer.applied_email(current_user, @group, @master).deliver
   end

   redirect_to "/groups/out_top/#{params[:id]}"

  end

end
