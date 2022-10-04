class GroupsController < ApplicationController
   before_action :set_group, only: [:show, :edit, :update]
   before_action :move_to_index, except: [:index, :show]

  def index
    @groups = Group.all
  end


  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to action: :index
  end

  private

  def group_params
    params.require(:group).permit(:group, :first_user, :second_user, :third_user, :fourth_user, :fifth_user, :sixth_user, :group_since, :text).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
