class EventsController < ApplicationController
  
  #ログイン者のみ表示
  before_action :authenticate_user!

  def exit
   @user = User.where("id = ?", current_user.id).first
   @user.state_group_id = -1
   @user.save
   redirect_to root_path
  end

  def index
   @year = params[:year]
   @month = params[:month]
   @day = params[:day]
   @events = Event.where("group_id = ?", current_user.state_group_id)
  end

  def show
   @event = Event.where("id = ?", params[:e_id]).first
   @attend = Attendance.where("e_id = ?", params[:e_id])
  end

  def all
   @events = Event.where("group_id = ?", current_user.state_group_id)
  end

  def new
   @event = Event.new
  end

  def attend
   @check = Attendance.where("e_id = ?", params[:e_id]).where("user_id = ?", current_user.id).first
   if @check == nil then
   @attend = Attendance.new
   @attend.e_id = params[:e_id]
   @attend.username = current_user.username
   @attend.user_id = current_user.id
   @attend.save
   redirect_to "/events/show/#{params[:e_id]}"
   else
   end
  end

  def absence
   @absence = Attendance.where("e_id = ?", params[:e_id]).where("user_id = ?", current_user.id).first
   @absence.destroy
   redirect_to "/events/show/#{params[:e_id]}"
  end

  def edit
   @original = Event.where("id = ?", params[:e_id]).first
  end

  def delete
   @event = Event.find(params[:e_id])
   if @event.username != current_user.username then
   else
    @event.destroy
#    @attend = Attendance.where("e_id = ?", params[:e_id])
#    if @attend != nil then
#    @attend.destroy
#    redirect_to "/events/calender/0"
#    else
#    end
   end
     redirect_to "/events/calender/0"
  end

  def create

      if params[:event][:title].empty? then
        if params[:event][:about].empty? then
          if params[:event][:id] == nil then
          redirect_to "/events/new", flash: {title_error: 'タイトルを入力してください', about_error: '内容を入力してください' }
          else
          redirect_to "/events/edit/#{params[:event][:id]}", flash: {title_error: 'タイトルを入力してください', about_error: '内容を入力してください'}
          end
        else
          if params[:event][:id] == nil then
          redirect_to "/events/new", flash: {title_error: 'タイトルを入力してください', _about: params[:event][:about]}
          else
          redirect_to "/events/edit/#{params[:event][:id]}", flash: {title_error: 'タイトルを入力してください', _about: params[:event][:about]}
          end
        end
      elsif params[:event][:about].empty? then
        if params[:event][:id] == nil then
        redirect_to "/events/new", flash: {about_error: '内容を入力してください', _title: params[:event][:title]}
        else
	redirect_to "/events/edit/#{params[:event][:id]}", flash: {about_error: '内容を入力してください', _title: params[:event][:title]}
        end
      else

        if params[:event][:id] != nil then
          @original = Event.find(params[:event][:id].to_i)
          @original.destroy
        else
        end

        @year = params[:event][:year].to_i
    	@month = params[:event][:month].to_i
    	@date = params[:event][:date].to_i

        if Date.valid_date?(@year, @month, @date) then
          @event = Event.new
          if params[:event][:id] != nil then 
            @event.id = params[:event][:id].to_i
          else
          end
          @event.title = params[:event][:title]
    	  @event.about = params[:event][:about]
     	  @event.year = params[:event][:year]
      	  @event.month = params[:event][:month]
      	  @event.date = params[:event][:date]
      	  @event.username = current_user.username
      	  @event.user_id = current_user.id
          @event.group_id = current_user.state_group_id
      	  @event.save
      	  redirect_to "/events/calender/0"
        else
        redirect_to "/events/new"
        end
      end
  end

  def calender

   @users = User.all

   if params[:num].nil? then
      @day = Date.today
   elsif params[:num] == '-6' then
      @day = Date.today.months_ago(6)
   elsif params[:num] == '-5' then
      @day = Date.today.months_ago(5)
   elsif params[:num] == '-4' then
      @day = Date.today.months_ago(4)
   elsif params[:num] == '-3' then
      @day = Date.today.months_ago(3)
   elsif params[:num] == '-2' then
      @day = Date.today.months_ago(2)
   elsif params[:num] == '-1' then
      @day = Date.today.last_month
   elsif params[:num] == '0' then
      @day = Date.today
   elsif params[:num] == '1' then
      @day = Date.today.next_month
   elsif params[:num] == '2' then
      @day = Date.today.months_since(2)
   elsif params[:num] == '3' then
      @day = Date.today.months_since(3)
   elsif params[:num] == '4' then
      @day = Date.today.months_since(4)
   elsif params[:num] == '5' then
      @day = Date.today.months_since(5)
   else
      @day = Date.today
   end
   @events = Event.where("group_id = ?", current_user.state_group_id)
  end

end
