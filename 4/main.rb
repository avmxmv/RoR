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
        check_station
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
    rescue
      puts "Неверные входные данные"
      create_train
    end
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
    puts 'Введите имя станции'
    name = gets.chomp
    @stations.delete(@stations.find(name))
  end

  def new_train_speed
    print_trains
    puts 'Введите индекс поезда'
    index = gets.chomp.to_i
    puts 'Введите новую скорость поезда'
    speed = gets.chomp.to_i
    @trains[index].new_speed(speed)
  end

  def look_train_speed
    print_trains
    puts 'Введите индекс поезда'
    index = gets.chomp.to_i
    @trains[index].speed
  end

  def stop_train
    print_trains
    puts 'Введите индекс поезда'
    index = gets.chomp.to_i
    @trains[index].stop
  end

  def route_for_train
    print_trains
    puts "Выберите номер поезда"
    t_num = gets.chomp
    puts @routes.inspect
    puts "Выберите индекс маршрута"
    r_index = gets.chomp.to_i
    @trains.find(t_num).set_route(@routes.index(r_index))
  end

  def main_forward
    print_trains
    puts "Выберите номер поезда"
    t_num = gets.chomp
    @trains.find(t_num).forward
  end

  def main_backward
    print_trains
    puts "Выберите номер поезда"
    t_num = gets.chomp
    @trains.find(t_num).backward
  end

  def check_station
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
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
    puts '12. Посмотреть список станций'
  end
end

Interface.new.run
