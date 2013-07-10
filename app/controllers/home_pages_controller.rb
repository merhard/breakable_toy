class HomePagesController < ApplicationController
  def index
    @sports = Sport.all

    @locations = []
    Court.all.each do |court|
      @locations << court.location
    end

    @json = @locations.to_gmaps4rails
  end
end
