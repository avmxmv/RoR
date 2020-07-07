# frozen_string_literal: true

module AllStation
  def all_st
    puts @first
    puts @middle_stations
    puts @last
  end
end

class Route
  include AllStation
  include Validation

  attr_accessor :stations
  attr_reader :first
  attr_reader :last

  validate :station, :type, Station

  @kol = 0

  def initialize(first, last)
    @first = first
    @last = last
    validate!
    @stations = [first, last]
    @kol += 1
    puts 'Станции успешно добавлены'
  end

  def add_st(station)
    @stations.insert(-2, station)
    puts 'Станция успешно добавлена'
  end

  def del_st(station)
    @stations.delete(station)
    puts 'Станция успешно удалена'
  end
end
