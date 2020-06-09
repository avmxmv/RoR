class Train
  attr_reader :type
  attr_reader :number
  attr_reader :speed
  attr_reader :route
  attr_accessor :vagons

  @@train = {}
  @@kol = 0

  def self.find(number)
    if @@train[number]
      @@train[number]
    end
  end

  def initialize(number, type)
    @number = number
    @type = type
    @vagons = []
    @@kol += 1
    @@train[number] = type
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

  def add_vagon(vagon)
    if vagon.type == @type
      @vagons << vagon
    end
  end

  def del_vagon(vagon)
    if vagon.type == @type
      @vagons.delete_at(-1)
    end
  end
end

class PassengerTrain < Train  
end

class CargoTrain < Train
end

class Vagon
  attr_accessor :type

  def initialize(type)
    @type = type  
  end
end