class GroupsController < ApplicationController

  #ログイン者のみ表示
  before_action :authenticate_user!

  def delete
    @group = Group.where("id = ?", params[:id]).first
    if @group.master_id != current_user.id then
    redirect_to "no_title"
    else
    @group.destroy
    @member = Member.where("group_id = ?", params[:id])
    @member.destroy_all
    redirect_to "/groups/my_group"
    end
  end

  def delete_member
    @member = Member.where("group_id = ?", params[:id]).where("user_id = ?", current_user.id).first
    @member.destroy
    redirect_to root_path
  end

  def new
    @group = Group.new
  end

  def update
  end

  def index
  end

  def show
  end

  def waiting
    @group = Group.where("id = ?", params[:id]).first
  end

  def create
    if params[:group][:group_id] != nil then
      @group = Group.where("id = ?", params[:group][:group_id]).first
      @group.name = params[:group][:name]
      @group.about = params[:group][:about]

      if @group.save
        redirect_to "/groups/my_group"
      else
        redirect_to "/members/applicater/#{@group.id}"
      end
    elsif params[:group][:group_id] == nil then
       @group = Group.new
       @group.name = params[:group][:name]
       @group.master_id = current_user.id
       @group.master_name = current_user.username
       @group.about = params[:group][:about]
       if @group.save
         redirect_to "/groups/my_group"
       else
         render "new"
       end
    end
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
     @user = User.where("id = ?", current_user.id).first
     @user.state_group_id = @group_id
     @user.save
     redirect_to "/posts"
    elsif @member.p == 0 then
     redirect_to "/groups/waiting/#{@group_id}"
    else
    end
  end

  def top_page
  end

end
