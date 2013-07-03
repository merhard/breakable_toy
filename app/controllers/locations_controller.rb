class LocationsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def edit
    @location = @user.location
  end

  def update
    @location = @user.location
    if @location.update_attributes(params[:location])
      flash[:success] = "Location updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      redirect_to new_user_session_path, notice: "Please sign in." unless user_signed_in?
    end

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to root_path, notice: "Access denied." unless current_user == @user
    end
end
