# frozen_string_literal: true
# rubocop:disable all

require_relative 'accessors'
require_relative 'validation'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'module'
require_relative 'cargo_carriages'
require_relative 'cargo_trains'
require_relative 'passenger_carriages'
require_relative 'passenger_trains'
require_relative 'carriages'

class Interface
  COMMANDS = {
    '1' => 'create_station', '2' => 'create_train', '3' => 'create_route', '4' => 'add_station',
    '5' => 'delete_station', '6' => 'new_train_speed', '7' => 'look_train_speed', '8' => 'stop_train',
    '9' => 'route_for_train', '10' => 'main_forward', '11' => 'main_backward', '12' => 'print_station',
    '13' => 'add_vagon', '14' => 'del_vagon', '15' => 'occupy_volume'
  }.freeze

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  def run
    loop do
      help
      puts 'Выберите пункт'
      choice = gets.chomp
      send(COMMANDS[choice])
    end
  end

  def create_station
    puts 'Введите имя станции'
    name = gets.chomp
    @stations << Station.new(name)
  end

  def print_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. #{train.number}"
    end
  end

  def select_train
    print_trains
    print 'Введите индекс поезда: '
    @trains[gets.to_i - 1]
  end

  def create_train
    puts 'Введите имя поезда'
    name = gets.chomp
    puts 'Выберите тип поезда'
    puts '1. PassengerTrain'
    puts '2. CargoTrain'
    type = gets.chomp
    @trains << if type == '1'
                 PassengerTrain.new(name)
               else
                 CargoTrain.new(name)
               end
  rescue StandardError => e
    puts e.message
    retry
  end

  def create_route
    print_station
    puts 'Введите индекс начальной станции'
    index1 = gets.chomp.to_i
    puts 'Введите индекс конечной станции'
    index2 = gets.chomp.to_i
    @routes << Route.new(@stations[index1 - 1], @stations[index2 - 1])
  end

  def print_routes
    @routes.each.with_index(1) do |route, index|
      puts "#{index}. #{route.stations.first.name}-#{route.stations.last.name}"
    end
  end

  def add_station
    print_routes
    puts 'Введите номер маршрута'
    route = @trains[gets.to_i - 1]
    puts 'Введите имя станции'
    name = gets.chomp
    station = Station.new(name)
    @stations << station
    route.add_st(station)
  end

  def delete_station
    print_routes
    puts 'Введите номер маршрута'
    route = @trains[gets.to_i - 1]
    print_station
    puts 'Введите имя станции'
    name = gets.chomp
    station = @stations.find(name)
    route.del_st(station)
  end

  def new_train_speed
    train = select_train
    puts 'Введите новую скорость поезда'
    speed = gets.chomp.to_i
    train.new_speed(speed)
  end

  def look_train_speed
    train = select_train
    puts train.speed
  end

  def stop_train
    train = select_train
    train.stop
  end

  def route_for_train
    train = select_train
    print_routes
    puts 'Выберите индекс маршрута'
    train.set_route(@routes[gets.to_i - 1])
  end

  def main_forward
    train = select_train
    train.forward
  end

  def main_backward
    train = select_train
    train.backward
  end

  def print_station
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}, поезда: #{station.trains}"
    end
  end

  def add_vagon
    train = select_train
    if train.class == PassengerTrain
      puts 'Введите количество мест в вагоне'
      kol = gets.chomp.to_i
      vagon = PassengerCarriage.new(kol)
    else
      puts 'Введите количество объёма в вагоне'
      volume = gets.chomp.to_i
      vagon = CargoCarriage.new(volume)
    end
    train.add_vagon(vagon)
  end

  def del_vagon
    train = select_train
    train.del_vagon
  end

  def print_vagons(train)
    train.vagons.each.with_index(1) do |vagon_c, index|
      puts "#{index}. #{vagon_c}"
    end
  end

  def occupy_volume
    train = select_train
    print_vagons(train)
    print 'Введите индекс вагона: '
    vagon = train.vagons[gets.to_i - 1]
    if vagon.class == PassengerCarriage
      vagon.reservation
    else
      puts 'Введите количество объёма которое хотите заполнить'
      volume = gets.chomp.to_i
      vagon.filling(volume)
    end
  end

  def help
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
    puts '9. Присвоить маршрут поезду'
    puts '10. Перемещение по маршруту вперёд на 1 станцию'
    puts '11. Перемещение по маршруту назад на 1 станцию'
    puts '12. Посмотреть список станций и список поездов на станции'
    puts '13. Добавлять вагоны к поезду'
    puts '14. Отцеплять вагоны от поезда'
    puts '15. Бронировать места в вагоне или заполнять вагон'
  end
end

Interface.new.run
