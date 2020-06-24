# frozen_string_literal: true

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
  def initialize
    # код который выполняется при создании объекта
    @trains = []
    @routes = []
    @stations = []
  end

  def run # главный запуск
    loop do
      help # вызов информации выбора каждый раз
      puts "Выберите пункт"
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
      when 9
        route_for_train
      when 10
        main_forward
      when 11
        main_backward
      when 12
        print_station
      when 13
        add_vagon
      when 14
        del_vagon
      when 15
        abs
      end
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
    begin
      puts 'Введите имя поезда'
      name = gets.chomp
      puts 'Выберите тип поезда'
      puts '1. PassengerTrain'
      puts '2. CargoTrain'
      type = gets.chomp
      if type == '1'
        @trains << PassengerTrain.new(name)
      else
        @trains << CargoTrain.new(name)
      end
    rescue => e
      puts e.message
      retry
    end
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
      puts "#{index}. #{route.stations.first.name}, #{route.stations.last.name}"
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
    puts @routes.inspect
    puts "Выберите индекс маршрута"
    r_index = gets.chomp.to_i
    train.set_route(@routes.index(r_index))
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
      puts "Введите количество мест в вагоне"
      kol = gets.chomp.to_i
      vagon = PassengerCarriage.new(kol)
    else
      puts "Введите количество объёма в вагоне"
      volume = gets.chomp.to_i
      vagon = CargoCarriage.new(volume)
    end
    train.add_vagon(vagon)
  end

  def del_vagon
    train = select_train
    train.del_vagon
  end

  def print_vagons
    train.vagons.each.with_index(1) do |vagon_c, index|
      puts "#{index}. #{vagon_c}"
    end
  end

  def booking
    train = select_train
    print_vagons
    print 'Введите индекс вагона: '
    train.vagons[gets.to_i - 1].reservation
  end

  def filling_out
    puts "Введите количество объёма которое хотите заполнить"
    volume = gets.chomp.to_i
    train = select_train
    print_vagons
    print 'Введите индекс вагона: '
    train.vagons[gets.to_i - 1].filling(volume)
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
    puts '9. Присвоить маршрут поезду'
    puts '10. Перемещение по маршруту вперёд на 1 станцию'
    puts '11. Перемещение по маршруту назад на 1 станцию'
    puts '12. Посмотреть список станций и список поездов на станции'
    puts '13. Добавлять вагоны к поезду'
    puts '14. Отцеплять вагоны от поезда'
  end
end

Interface.new.run
