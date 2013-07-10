class CourtsController < ApplicationController
  def show
    @court = Court.find(params[:id])
    @sport = @court.sport
    @location = @court.location
  end

  def new
    @court = Court.new
    @sport = @court.sport
    @location = @court.location
  end

  def create

  end
end
