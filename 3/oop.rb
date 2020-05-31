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
  attr_reader :speed
  attr_reader :route

  def initialize(number, type, len)
    @number = number
    @type = type
    @len = len
  end

  def new_speed(speed)
    @speed = speed
  end

  def speed_now
    @speed
  end

  def stop
    @speed = 0
  end

  def kol_vagonov
    @len
  end

  def vagon(vagon)
    if @speed == 0
      @len += vagon
    else
      puts "Поезд движется"
    end
  end

  def marshrut
    @route = []
    @route << [Route.first, 1]
    @route << Route.middle_st
    @route << [Route.last, 0]
  end

  def station(flag)
    if flag > 0
      f = 0
      @route.each do |el|
        if f == 0 && el[1] == 1
          f = 1
          el[1] = 0
        elsif f == 1
          el[1] = 1
          f = 2
        end
      end
    end
  end

  def look_route
    f = 0
    @route.each do |el|
      if f == 0 && el[1] == 1
        el
        f = 1
      elsif f == 1
        el
        f = 2
      end
    end
  end
end
=begin
s1 = Station.new("Vladimir")
s2 = Station.new("Moscow")
t1 = Train.new("1", "грузовой", 140)
t2 = Train.new("2", "пассажирский", 40)
t3 = Train.new("3", "грузовой", 48)
=end