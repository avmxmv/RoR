require_relative 'routes'
require_relative 'station'
require_relative 'train'
require_relative 'modules'
puts "Добро пожаловать"
puts "Вы можете:"
puts "Создать маршрут - Routes.new, и добавлять или удалять в нём станции add_st, del_st."
puts "Создавать станции - Station.new, искать количесво поездов определённого типа count_trains_by_type, добавлять и удалять станции set_train, unset_train."
puts "Создавать поезда - Train.new, искать поезда по номеру self.find(number), задавать разные скорости, проверять текущую скороть или останавливать поезд - new_speed(speed), speed_now, stop, а также добавлять и удалять вагоны - add_vagon, del_vagon."


