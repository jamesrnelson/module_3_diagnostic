class SearchController < ApplicationController
  def index
    Faraday.new

    GET https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest/format?parameters


  end
end
