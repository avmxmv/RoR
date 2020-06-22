require_relative 'carriages'

class PassengerCarriage < Carriage
  attr_accessor :kol
  attr_accessor :kol_occupied

  def initialize(kol)
    @kol = kol
    @kol_occupied = 0
  end

  def reservation
    @kol_occupied += 1
  end

  def kol_reservation
    puts "Количество занятых мест #{@kol_occupied}"
  end

  def kol_free_sits
    puts "Количество свободных мест #{@kol - @kol_occupied}"
  end
end