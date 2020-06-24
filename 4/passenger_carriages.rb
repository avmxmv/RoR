require_relative 'carriages'

class PassengerCarriage < Carriage
  def reservation
    if @quantity_occupied + 1 <= @quantity
      @quantity_occupied += 1
    else
      puts "Все места заняты"
    end
  end
end