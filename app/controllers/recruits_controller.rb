class RecruitsController < ApplicationController

  def index
    @recruits = Recruit.all.order(created_at: 'desc')
  end

  def show
    @recruits = Recruit.find(params[:id])
  end

  def new
    @recruits = Recruit.new
  end

  def edit
    @recruits = Recruit.find(params[:id])
  end

  def create
    @recruits = Recruit.new(post_params)
    if @recruits.save
      redirect_to recruits_path
    else
      render 'new'
    end
  end

  def update
    @recruits = Recruit.find(params[:id])
    if @recruits.update(recruit_params)
      redirect_to recruits_path
    else
      render 'edit'
    end
  end

  def destroy
    def destroy
      @recruits = Recruit.find(params[:id])
      @recruits.destroy
      redirect_to recruits_path
    end
  end

end
