require_relative 'carriages'

class CargoCarriage < Carriage
  def filling(kol)
    if @filled_volume + kol <= @volume
      @filled_volume += kol
    else
      puts "Слишком большой объём"
    end
  end
end