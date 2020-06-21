# frozen_string_literal: true
module All_st
  def all_st
    puts @first
    puts @middle_stations
    puts @last
  end
end

class Route
  include All_st
  attr_accessor :stations
  attr_reader :first
  attr_reader :last

  @@kol = 0

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    # validate!
    @@kol += 1
    puts "Станции успешно добавлены"
  end

  # добавление станции
  def add_st(station)
    @station.insert(-2, station)
    puts "Станция успешно добавлена"
  end
  # удаление станции
  def del_st(station)
    @station.delete(station)
    puts "Станция успешно удалена"
  end

  private

  # я считаю что методы добавления и удаления должны быть приватными
  def validate!
    raise 'Недостаточно станций' if first != nil && last != nil
  end

  def valid?
    validate!
    true
  rescue
    false
  end
end