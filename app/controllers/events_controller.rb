class EventsController < ApplicationController
  def index
  end

  def show
   @event = Event.where("id = ?", params[:e_id]).first
  end

  def create
   @event = Event.new
   @event.title = params[:event][:title]
   @event.about = params[:event][:about]
   @event.year = params[:event][:year]
   @event.month = params[:event][:month]
   @event.date = params[:event][:date]
   @event.username = params[:event][:username]
   @event.save
  end

  def calender
   if params[:num] == '0' then
      @day = Date.today
   elsif params[:num] == '-1' then
      @day = Date.today.last_month
   elsif params[:num] == '1' then
      @day = Date.today.next_month
   else
      @day = Date.today
   end

   @events = Event.all
  end

end
