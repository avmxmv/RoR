class Route
  attr_accessor :middle_stations
  attr_reader :first
  attr_reader :last

  def initialize(first, last)
    @first = first
    @last = last
    @middle_stations = []
  end

  def all_st
    puts @first
    puts @middle_stations
    puts @last
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