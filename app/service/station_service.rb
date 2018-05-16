class StationService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def raw_search
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :zip_code

    def connection
      Faraday.new(url: "https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest/?format=json&location=#{@zip_code}"
    end
end
