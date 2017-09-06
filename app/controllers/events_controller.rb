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
end
