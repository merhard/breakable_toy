class SearchesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def show
    unless params[:q]
      @q = Court.search(params[:q])
      @courts = Court.page(params[:page]).per(5)
    else
      @q = Court.limit(200).search(params[:q])
      court_results = @q.result.all.uniq
      @courts = Kaminari.paginate_array(court_results).page(params[:page]).per(5)
    end
    if user_signed_in?
      @location = current_user.location
    end
  end
end
