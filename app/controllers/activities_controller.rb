class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to action: :create
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end


  private

  def activity_params
    params.require(:activity).permit(:group, :activity_day, :song, :studio, :text, :image).merge(user_id: current_user.id)
  end

end
