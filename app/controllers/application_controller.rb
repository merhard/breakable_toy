class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    user_path(current_user)
  end

  private

    def signed_in_user
      unless user_signed_in?
        flash[:alert] = "Please sign in."
        redirect_to new_user_session_path
      end
    end

    def correct_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @user = User.find(params[:id])
      end

      unless current_user == @user
        flash[:error] = "Access denied."
        redirect_to root_path
      end
    end

end
