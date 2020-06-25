require_relative 'carriages'

class CargoCarriage < Carriage
  def filling(kol)
    if @filled_or_occupied + kol <= @volume_or_quantity
      @filled_or_occupied += kol
    else
      puts "Слишком большой объём"
    end
  end
end