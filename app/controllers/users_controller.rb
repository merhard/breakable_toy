class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :default_location_edit, only: [:show]

  def show
    @user = User.find(params[:id])
    @location = @user.location
    @json = @location.to_gmaps4rails
  end

  def edit
    @location = current_user.location
  end

  def update
    @location = current_user.location
    if current_user.update_attributes(params[:user])
      redirect_to current_user, notice: "Profile updated"
    else
      flash.now[:error] = 'Profile not updated'
      render 'edit'
    end
  end

  private

    def default_location_edit
      location = current_user.location
      if location.state == '?'
        result = request.location
        location.city = result.city unless result.city == ''
        location.state = result.state unless result.state == ''
        location.save
      end
    end
end
