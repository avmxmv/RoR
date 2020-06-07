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
    @@kol += 1
  end

  private

  # я считаю что методы добавления и удаления должны быть приватными
  def add_st(station)
    middle_stations << station
  end

  def del_st(station)
    middle_stations.delete(station)
  end
end