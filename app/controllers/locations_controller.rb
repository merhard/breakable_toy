class LocationsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def edit
    @location = current_user.location
    @json = @location.to_gmaps4rails
  end

  def update
    @location = current_user.location
    if @location.update_attributes(params[:location])
      redirect_to current_user, notice: "Location updated"
    else
      flash.now[:error] = 'Location not updated'
      render 'edit'
    end
  end

end
