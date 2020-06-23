require_relative 'carriages'

class CargoCarriage < Carriage
  attr_accessor :volume
  attr_accessor :filled_volume

  def initialize(volume)
    @volume = volume
    @filled_volume = 0
  end

  def filling(kol)
    @filled_volume += kol
  end

  def kol_reservation
    @filled_volume
  end

  def kol_free_sits
    @volume - @filled_volume
  end
end