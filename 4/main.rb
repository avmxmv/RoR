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
        puts 'Введите имя станции'
        name = gets.chomp.to_str
        @station << Station.new(name)
      when 2
        puts 'Введите имя поезда'
        name = gets.chomp.to_str
        puts 'Выберите тип поезда'
        type = gets.chomp.to_str
        trains_arr << Train.new(name, type)
      when 3
        puts station_arr
        puts 'Введите индекс начальной станции'
        index1 = gets.chomp.to_i
        puts 'Введите индекс конечной станции'
        index2 = gets.chomp.to_i
        routes_arr << Route.new(station_arr[index1], station_arr[index2])
      when 4
        puts routes_arr
        puts 'Введите имя новой станции'
        name = gets.chomp.to_str
        puts 'Введите индекс маршрута'
        index = gets.chomp.to_i
        routes_arr[index].add_st(name)
      when 5
        puts station_arr
        puts 'Введите индекс станции'
        index = gets.chomp.to_i
        puts 'Введите имя станции для удаления'
        name = gets.chomp.to_str
        station_arr[index].del_st(name)
      when 6
        puts trains_arr
        puts 'Введите индекс поезда'
        index = gets.chomp.to_i
        puts 'Введите новую скорость поезда'
        speed = gets.chomp.to_i
        trains_arr[index].new_speed(speed)
      when 7
        puts trains_arr
        puts 'Введите индекс поезда'
        index = gets.chomp.to_i
        trains_arr[index].speed
      when 8
        puts trains_arr
        puts 'Введите индекс поезда'
        index = gets.chomp.to_i
        trains_arr[index].stop
      else
        puts 'Неправильные данные'
      end
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
  end
end

Interface.new.run