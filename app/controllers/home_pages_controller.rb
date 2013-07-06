class HomePagesController < ApplicationController
  def index
    @sports = Sport.all

    if user_signed_in?
      @user = current_user
    end

    @locations = []
    Court.all.each do |court|
      @locations << court.location
    end

    @json = @locations.to_gmaps4rails
  end
end
