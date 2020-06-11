# frozen_string_literal: true
class Route
  include All_st
  attr_accessor :middle_stations
  attr_reader :first
  attr_reader :last

  @@kol = 0

  def initialize(first, last)
    @first = first
    @last = last
    @middle_stations = []
    valid?
    @@kol += 1
    puts "Станции успешно добавлены"
  end

  private

  # я считаю что методы добавления и удаления должны быть приватными
  def validate!
    raise 'Недостаточно станций' if first && last
  end

  def valid?
    validate!
    true
  rescue
    puts "Введите данные ещё раз"
    false
  end

  def add_st(station)
    middle_stations << station
    puts "Станция успешно добавлена"
  end

  def del_st(station)
    middle_stations.delete(station)
    puts "Станция успешно удалена"
  end
end