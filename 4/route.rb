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
  attr_accessor :stations
  attr_reader :first
  attr_reader :last

  @@kol = 0

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    @@kol += 1
    puts 'Станции успешно добавлены'
  end

  def add_st(station)
    @station.insert(-2, station)
    puts 'Станция успешно добавлена'
  end

  def del_st(station)
    @station.delete(station)
    puts 'Станция успешно удалена'
  end

  private

  def validate!
    raise 'Недостаточно станций' if !first.nil? && !last.nil?
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
