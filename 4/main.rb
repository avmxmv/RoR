# frozen_string_literal: true

require_relative 'routes'
require_relative 'station'
require_relative 'train'
require_relative 'modules'

class Interface
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
  trains_arr = []
  routes_arr = []
  station_arr = []
  loop do
    puts 'Выберите пункт'
    a = gets.chomp.to_i
    case a
    when 1
      puts 'Выберите имя станции'
      b = gets.chomp.to_str
      s = Station.new(b)
      station_arr << s
    when 2
      puts 'Выберите имя поезда'
      b = gets.chomp.to_str
      puts 'Выберите тип поезда'
      c = gets.chomp.to_str
      t = Train.new(b, c)
      trains_arr << t
    when 3
      puts station_arr
      puts 'Выберите индекс начальной станции'
      b = gets.chomp.to_i
      puts 'Выберите индекс конечной станции'
      c = gets.chomp.to_i
      r = Route.new(station_arr[b], station_arr[c])
      routes_arr << r
    when 4
      puts routes_arr
      puts 'Выберите имя новой станции'
      c = gets.chomp.to_str
      puts 'Выберите индекс маршрута'
      b = gets.chomp.to_i
      routes_arr[b].add_st(c)
    when 5
      puts station_arr
      puts 'Выберите индекс станции'
      b = gets.chomp.to_i
      puts 'Выберите имя станции для удаления'
      c = gets.chomp.to_str
      station_arr[b].del_st(c)
    when 6
      puts trains_arr
      puts 'Выберите индекс поезда'
      b = gets.chomp.to_i
      puts 'Выберите новую скорость поезда'
      c = gets.chomp.to_i
      trains_arr[b].new_speed(c)
    when 7
      puts trains_arr
      puts 'Выберите индекс поезда'
      b = gets.chomp.to_i
      trains_arr[b].speed
    when 8
      puts trains_arr
      puts 'Выберите индекс поезда'
      b = gets.chomp.to_i
      trains_arr[b].stop
    else
      puts 'Неправильные данные'
    end
  end
end
