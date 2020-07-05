# rubocop:disable all
# # frozen_string_literal: true

class Train
  include Acсessors

  attr_accessor_with_history :my_attr

  attr_accessor :number
  attr_accessor :speed
  attr_accessor :route
  attr_accessor :vagons

  validate :number, :format, /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/

  @train = {}
  @kol = 0

  def my_attr_history
    my_attr.instance_variables
  end

  def self.find(number)
    @train[number]
  end

  def initialize(number)
    @number = number
    @vagons = []
    valid?
    @kol += 1
    @train[number] = self
    puts "Создан поезд с номером #{number}"
  end

  def new_speed(speed)
    @speed = speed
    puts "Установлена скорость #{@speed}"
  end

  def speed_now
    @speed
  end

  def stop
    @speed = 0
    puts 'Поезд остановился, есть возможность добавить вагон'
  end

  def add_vagon(vagon)
    @vagons << vagon
    puts 'Вагон успешно добавлен'
  end

  def del_vagon
    @vagons.delete_at(-1)
    puts 'Вагон успешно удалён'
  end

  def set_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station.set_train(self)
  end

  def current_station_index
    @route.stations.index(@current_station)
  end

  def next_station
    @route.stations[current_station_index + 1]
  end

  def prev_station
    @route.stations[current_station_index - 1] if current_station_index != 0
  end

  def forward
    if next_station
      @current_station.unset_train(self)
      @current_station = next_station
      @current_station.set_train(self)
    else
      puts 'Нет следующей станции'
    end
  end

  def backward
    if prev_station
      @current_station.unset_train(self)
      @current_station = prev_station
      @current_station.set_train(self)
    else
      puts 'Нет предыдущей станции'
    end
  end

  def each_wagon(&block)
    @vagons.each do |el|
      block.call(el)
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    puts 'Попробуйте ещё раз'
    false
  end
end
