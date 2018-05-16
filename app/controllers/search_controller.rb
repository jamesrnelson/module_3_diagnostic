class SearchController < ApplicationController
  def index
    @fuel_stations = StationListing.new(params[:query])
  end
end
