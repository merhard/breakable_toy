class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
    @courts = @sport.courts
    @court_locations = {}
    @courts.each do |court|
      @court_locations[court] = court.location
    end
  end
end
