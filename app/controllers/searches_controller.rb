class SearchesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def show
    @q = Court.search(params[:q])
    @courts = @q.result(distinct: true)
  end
end
