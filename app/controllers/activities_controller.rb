class ActivitiesController < ApplicationController
  before_action :set_act, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @activities = Activity.includes(:user).order("activity_day DESC")
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
    @comment = Comment.new
    @comments = @activity.comments.includes(:user)
  end

  def edit
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

  def set_act
    @activity = Activity.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
