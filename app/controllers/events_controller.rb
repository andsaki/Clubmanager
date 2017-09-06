class EventsController < ApplicationController
  def index
  end

  def show
   @event = Event.where("id = ?", params[:e_id]).first
  end
end
