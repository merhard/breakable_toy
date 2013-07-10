class CourtsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def show
    @court = Court.find(params[:id])
    @sport = @court.sport
    @location = @court.location
    @json = @location.to_gmaps4rails
  end

  def new
    @court = Court.new
  end

  def create
    number_of = params[:court][:number_of].to_i
    sport_id = params[:court][:sport_id].to_i
    location = params[:court][:location]

    @court = Court.new(number_of: number_of, sport_id: sport_id)
    @location = Location.find_or_create_by_street_address_and_city_and_state(location)
    @court.location = @location

    if @court.save
      redirect_to @court, notice: 'Court was successfully added.'
    else
      flash.now[:error] = 'Court not added.'
      render 'new'
    end
  end
end
