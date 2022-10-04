class GroupsController < ApplicationController

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
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
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
end
