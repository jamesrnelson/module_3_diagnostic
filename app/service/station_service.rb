class StationService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def raw_search
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :zip_code

    def response
      Faraday.get(url: "https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest/?format=json&api_key=#{ENV['API_KEY']}location=#{@zip_code}"
    end
end
