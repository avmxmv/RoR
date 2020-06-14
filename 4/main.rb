require_relative 'routes'
require_relative 'station'
require_relative 'train'
require_relative 'modules'
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
for i in range(1..100)
  puts 'Выберите пункт'
  a = gets.chomp.to_i
  if a == 1
    puts 'Выберите имя станции'
    b = gets.chomp.to_str
    @s = Station.new(b)
    station_arr << @s
  elsif a == 2
    puts 'Выберите имя поезда'
    b = gets.chomp.to_str
    puts 'Выберите тип поезда'
    c = gets.chomp.to_str
    @t = Train.new(b, c)
    trains_arr << @t
  elsif a == 3
    puts 'Выберите индекс начальной станции'
    b = gets.chomp.to_i
    puts 'Выберите индекс конечной станции'
    c = gets.chomp.to_i
    @r = Route.new(station_arr[b], station_arr[c])
    routes_arr << @r
  elsif a == 4
    puts 'Выберите имя новой станции'
    c = gets.chomp.to_str
    puts 'Выберите индекс маршрута'
    b = gets.chomp.to_i
    routes_arr[b].add_st(c)
  elsif a == 5
    puts 'Выберите индекс станции'
    b = gets.chomp.to_i
    puts 'Выберите имя станции для удаления'
    c = gets.chomp.to_str
    station_arr[b].del_st(c)
  elsif a == 6
    puts 'Выберите индекс поезда'
    b = gets.chomp.to_i
    puts 'Выберите новую скорость поезда'
    c = gets.chomp.to_i
    trains_arr[b].new_speed(c)
  elsif a == 7
    puts 'Выберите индекс поезда'
    b = gets.chomp.to_i
    trains_arr[b].speed
  elsif a == 8
    puts 'Выберите индекс поезда'
    b = gets.chomp.to_i
    trains_arr[b].stop
  else
    puts 'Неправильные данные'
  end
end