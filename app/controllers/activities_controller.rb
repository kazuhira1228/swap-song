class ActivitiesController < ApplicationController

  def index
    @acts = Activity.all
  end

end
