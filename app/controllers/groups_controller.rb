class GroupsController < ApplicationController

  #ログイン者のみ表示
  before_action :authenticate_user!
  
  def index
  end

  def show
  end

  def waiting
    @group = Group.where("id = ?", params[:id]).first
  end

  def create
    @group = Group.new
    @group.name = params[:group][:name]
    @group.master_id = current_user.id
    @group.master_name = current_user.username
    @group.save
    redirect_to "/groups/my_group"
  end

  def out_top
    @group_id = params[:id]
  end

  def top
    @group_id = params[:id]
    @group = Group.where("id = ?", @group_id).first
    @member = Member.where("group_id = ?", @group_id).where("user_id = ?", current_user.id).first
    if ( @member == nil && ( @group.master_id != current_user.id) ) then
     redirect_to "/members/application/#{@group_id}"
    elsif ( (@group.master_id == current_user.id) || (@member.p == 1) ) then
     redirect_to "/groups/top_page/#{@group_id}"
    elsif @member.p == 0 then
     redirect_to "/groups/waiting/#{@group_id}"
    else
    end
  end

  def top_page
  end

end
