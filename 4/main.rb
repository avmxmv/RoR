require_relative 'routes'
require_relative 'station'
require_relative 'train'
require_relative 'modules'
puts "Добро пожаловать"
puts "Вы можете:"
puts "1. Создать станцию"
puts "2. Создать поезд"
puts "3. Создать маршрут"
puts "4. Добавить станцию в маршрут"
puts "5. Удалить станцию из маршрута"
puts "6. Установить скорость поезду"
puts "7. Посмотреть текущую скорость поезда"
puts "8. Остановить поезд"
for i in range(1..100)
  puts "Выберите пункт"
  a = gets.chomp.to_i
  if a == 1
    puts "Выберите имя станции"
    b = gets.chomp.to_str
    @s = Station.new(b)
  elsif a == 2
    puts "Выберите имя поезда"
    b = gets.chomp.to_str
    puts "Выберите тип поезда"
    c = gets.chomp.to_str
    @t = Train.new(b, c)
  elsif a == 3
    puts "Выберите имя начальной станции"
    b = gets.chomp.to_str
    puts "Выберите имя конечной станции"
    c = gets.chomp.to_str
    @r = Route.new(b, c)
  elsif a == 4
    puts "Выберите имя новой станции"
    c = gets.chomp.to_str
    @r.add_st(c)
  elsif a == 5
    puts "Выберите имя станции для удаления"
    c = gets.chomp.to_str
    @r.del_st(c)
  elsif a == 6
    puts "Выберите новую скорость поезда"
    c = gets.chomp.to_i
    @t.new_speed(c)
  elsif a == 7
    @t.speed
  elsif a == 8
    @t.stop
  else
    puts "Неправильные данные"
  end
end