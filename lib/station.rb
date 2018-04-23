require 'csv'

class Station
  STATIONS_FILEPATH = './resources/stations.csv'

  attr_reader :name, :zone
  def initialize(name)
    @name = name
    @zone = find_zone(name)
  end

  def find_zone(name)
    CSV.foreach(STATIONS_FILEPATH) do |line|
      station, zone = line
      return zone.to_i if station == name
    end
    raise 'Station not found'
  end
end
