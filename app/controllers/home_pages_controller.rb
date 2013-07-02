class HomePagesController < ApplicationController
  def index
    @sports = Sport.all
  end
end
