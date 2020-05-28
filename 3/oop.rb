class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  def trains=(trains)
    @trains = trains
  end

  def trains
    @trains
  end

  def set_train(train)
    @trains << train
  end

  def unset_train(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |el| el.type == type }
  end

  def count_trains_by_type(type)
    trains_by_type(type).count
  end
end

class Route
  attr_accessor :middle_st
  attr_reader :first
  attr_reader :last

  def initialize(first, last)
    @first = first
    @last = last
    @middle_st = []
  end

  def add_st(station)
    middle_st << station
  end

  def del_st(station)
    middle_st.delete(station)
  end

  def all_st
    puts @first
    puts @middle_st
    puts @last
  end
end

class Train
  attr_reader :type
  attr_reader :number
  attr_reader :len

  def initialize(number, type, len)
    @number = number
    @type = type
    @len = len
  end
end
=begin
s1 = Station.new("Vladimir")
s2 = Station.new("Moscow")
t1 = Train.new("1", "грузовой", 140)
t2 = Train.new("2", "пассажирский", 40)
t3 = Train.new("3", "грузовой", 48)
=end