class RecruitsController < ApplicationController

  def index
    @recruits = Post.all.order(created_at: 'desc')
    @events = Event.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create_table
  end

  def update
  end

  def destroy
  end

end
