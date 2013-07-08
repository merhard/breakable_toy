class SearchesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def show
    if user_signed_in?
      @location = current_user.location
    end

    if params[:q]

      if params[:within] && params[:within] != ''

        locations = Location.near(@location, params[:within])
        locations_id_array = []
        locations.each do |location|
          locations_id_array << location.id
        end

        if params[:q][:s]
          @q = Court.where(location_id: locations_id_array).limit(200).search(params[:q])
          court_results = @q.result.all.uniq
          @courts = Kaminari.paginate_array(court_results).page(params[:page]).per(5)
        else
          @q = Court.where(location_id: locations_id_array).search(params[:q])
          @courts = @q.result(distinct: true).page(params[:page]).per(5)
        end

      else

        if params[:q][:s]
          @q = Court.limit(200).search(params[:q])
          court_results = @q.result.all.uniq
          @courts = Kaminari.paginate_array(court_results).page(params[:page]).per(5)
        else
          @q = Court.search(params[:q])
          @courts = @q.result(distinct: true).page(params[:page]).per(5)
        end

      end

    else

      @q = Court.search(params[:q])
      @courts = Court.page(params[:page]).per(5)

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
