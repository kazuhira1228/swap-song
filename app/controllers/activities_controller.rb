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
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @comment = Comment.new
    @comments = @activity.comments.includes(:user)
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    activity = Activity.find(params[:id])
    if activity.update(activity_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to action: :index
  end


  private

  def activity_params
    params.require(:activity).permit(:group, :activity_day, :song, :studio, :text, :image).merge(user_id: current_user.id)
  end

end
