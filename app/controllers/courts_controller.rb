class CourtsController < ApplicationController
  def index
    @sport = Sport.find(params[:sport_id])
    @courts = @sport.courts
  end

  # def show
  #   @sport = Sport.find(params[:sport_id])
  #   @court = Court.find(params[:id])
  # end
end
