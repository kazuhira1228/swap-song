class ActivitiesController < ApplicationController

  def index
    @tweets = Tweet.all
  end

end
