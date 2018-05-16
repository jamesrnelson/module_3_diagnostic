class StationListing
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    raw_stations = service.raw_search
    raw_stations.map do |station|
      Station.new(station)
    end
  end

  private
    attr_reader :zip_code

    def service
      @service ||= StationService.new(zip_code)
    end
end
