# frozen_string_literal: true

require_relative 'routes'
require_relative 'station'
require_relative 'train'
require_relative 'modules'

class Interface
  def initialize
    # код который выполняется при создании объекта
    @trains = []
    @routes = []
    @stations = []
  end

  def run # главный запуск
    loop do
      help # вызов информации выбора каждый раз
      choice  = gets.chomp.to_i
      case choice
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        add_station
      when 5
        delete_station
      when 6
        new_train_speed
      when 7
        look_train_speed
      when 8
        stop_train
      end
    end
  end

  def create_station
    puts 'Введите имя станции'
    name = gets.chomp
    @stations << Station.new(name)
  end

  def create_train
    puts 'Введите имя поезда'
    name = gets.chomp
    puts 'Введите тип поезда'
    type = gets.chomp
    @trains << Train.new(name, type)
  end

  def create_route
    puts @stations.inspect
    puts 'Введите индекс начальной станции'
    index1 = gets.chomp.to_i
    puts 'Введите индекс конечной станции'
    index2 = gets.chomp.to_i
    @routes << Route.new(@stations[index1], @stations[index2])
  end

  def add_station
    puts 'Введите имя станции'
    name = gets.chomp
    station = Station.new(name)
    @stations << station
    @routes << station
  end

  def delete_station
    puts @stations.inspect
    puts 'Введите индекс станции'
    index = gets.chomp.to_i
    @stations.delete[index]
  end

  def new_train_speed
    puts @trains.inspect
    puts 'Введите индекс поезда'
    index = gets.chomp.to_i
    puts 'Введите новую скорость поезда'
    speed = gets.chomp.to_i
    @trains[index].new_speed(speed)
  end

  def look_train_speed
    puts @trains.inspect
    puts 'Введите индекс поезда'
    index = gets.chomp.to_i
    @trains[index].speed
  end

  def stop_train
    puts @trains.inspect
    puts 'Введите индекс поезда'
    index = gets.chomp.to_i
    @trains[index].stop
  end

  def help # информация
    puts 'Добро пожаловать'
    puts 'Вы можете:'
    puts '1. Создать станцию'
    puts '2. Создать поезд'
    puts '3. Создать маршрут'
    puts '4. Добавить станцию в маршрут'
    puts '5. Удалить станцию из маршрута'
    puts '6. Установить скорость поезду'
    puts '7. Посмотреть текущую скорость поезда'
    puts '8. Остановить поезд'
  end
end

Interface.new.run
