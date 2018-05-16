class StationListing
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    raw_stations = service.raw_search[:fuel_stations]
    raw_stations.map do |station|
      Station.new(station)
    end
  end

  def closest_stations
    all_stations.sort_by { |station| station.distance }[0..9]
  end

  private
    attr_reader :zip_code

    def service
      @service ||= StationService.new(zip_code)
    end
end
