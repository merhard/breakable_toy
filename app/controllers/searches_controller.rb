class SearchesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def show
    @q = Court.search(params[:q])
    court_results = @q.result(distinct: true)
    @courts = Kaminari.paginate_array(court_results).page(params[:page]).per(5)
  end
end
