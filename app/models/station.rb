class Station
  attr_reader :name, :address, :distance, :access_times
  def initialize(attributes)
    @name = attributes[:station_name]
    @distance = attributes[:distance]
    @street_address = attributes[:street_address]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @fuel_type_code = attributes[:fuel_type_code]
    @access_times = attributes[:access_days_time]
  end

  def address
    "#{@street_address}, #{@city}, #{@state} #{@zip}"
  end

  def fuel_type
    return "Electric" if @fuel_type_code == 'ELEC'
    return "Biodiesel (B20 and above)" if @fuel_type_code == 'BD'
    return "Compressed Natural Gas" if @fuel_type_code == 'CNG'
    return "Ethanol (E85)" if @fuel_type_code == 'E85'
    return "Hydrogen" if @fuel_type_code == 'HY'
    return "Hydrogen" if @fuel_type_code == 'HY'
    return "Propane" if @fuel_type_code == 'LPG'
  end
end
