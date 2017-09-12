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
   redirect_to "/members/applicater/#{@group.id}"
  end

  def permit
   @group = Group.where("id = ?", params[:group_id]).first
   @member = Member.where("id = ?", params[:user_id]).first
   @member.p = 1
   @member.save
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
  end

end
