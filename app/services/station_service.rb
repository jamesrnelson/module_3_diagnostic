class StationService
  def initialize(zip_code)
    @zip_code = zip_code.to_s
  end

  def raw_search
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :zip_code

    def connection
      Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest/?format=json&api_key=#{ENV['API_KEY']}&location=#{@zip_code}")
    end

    def response
      connection.get
    end
end
