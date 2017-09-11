class MembersController < ApplicationController
  def index
  end

  def show
  end

  def permit
   @group = Group.where("id = ?", params[:group_id]).first
   @member = Member.where("group_id = ?", params[:group_id]).where("user_id = ?", params[:user_id]).first
   @member.p = 1
   @member.save
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
