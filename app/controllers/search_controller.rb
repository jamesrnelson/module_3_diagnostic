class SearchController < ApplicationController
  def index
    @fuel_stations = StationListing.new(params[:q])
  end
end
