class SearchesController < ApplicationController
  def show
    @q = Court.search(params[:q])
    @courts = @q.result(distinct: true)
  end
end
