class SearchesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def show
    if user_signed_in?
      @location = current_user.location
    end

    if params[:distance] && params[:q]
      if params[:q][:s]
        params[:q].except!(:s)
      end
    end

    if params[:q]
      if params[:within] && params[:within] != ''
        if params[:q][:s] == 'undefined'
          params[:q].except!(:s)
          @q = Court.near(@location, params[:within], order: :distance).search(params[:q])
          @courts = @q.result(distinct: true).page(params[:page]).per(5)
        else
          @q = Court.joins(:location).near(@location, params[:within]).limit(200).search(params[:q])
          court_results = @q.result.all.uniq
          @courts = Kaminari.paginate_array(court_results).page(params[:page]).per(5)
        end
      else
        if params[:q][:s] == 'undefined'
          params[:q].except!(:s)
          @q = Court.near(@location, 3000, order: :distance).search(params[:q])
          @courts = @q.result(distinct: true).page(params[:page]).per(5)
        else
          @q = Court.joins(:location).near(@location, 3000).limit(200).search(params[:q])
          court_results = @q.result.all.uniq
          @courts = Kaminari.paginate_array(court_results).page(params[:page]).per(5)
        end
      end
    else
      @q = Court.search(params[:q])
      @courts = Court.joins(:location).near(@location, 3000, order: :distance).page(params[:page]).per(5)
    end

    @locations = []
    @courts.each do |court|
      @locations << court.location
    end

    if user_signed_in?
      @locations << @location
    end

    @json = @locations.to_gmaps4rails
  end
end
