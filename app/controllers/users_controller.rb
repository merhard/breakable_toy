class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
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
      @user = User.find(params[:id])
      redirect_to root_path, notice: "Access denied." unless current_user == @user
    end
end
