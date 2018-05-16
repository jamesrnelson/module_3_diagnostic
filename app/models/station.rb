class Station
  attr_reader :name, :address, :distance
  def initialize(attributes)
    @name = attributes[:fuel_stations][:station_name]
    @distance = attributes[:fuel_stations][:distance]
    street_address = attributes[:fuel_stations][:street_address]
    city = attributes[:fuel_stations][:city]
    state = attributes[:fuel_stations][:state]
    zip = attributes[:fuel_stations][:zip]
  end

  def address
    "#{street_address}, #{city}, #{state} #{zip}"
  end
end
