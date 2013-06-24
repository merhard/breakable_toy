class CourtsController < ApplicationController
  def index
    @sport = Sport.find(params[:sport_id])
    @courts = @sport.courts
    @court_locations = {}
    @courts.each do |court|
      @court_locations[court] = court.location
    end
  end

  # def show
  #   @sport = Sport.find(params[:sport_id])
  #   @court = Court.find(params[:id])
  # end
end
