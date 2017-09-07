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
   @events = Event.all
  end

end
