class Carriage
  attr_accessor :volume_or_quantity
  attr_accessor :filled_or_occupied

  def initialize(quantity_or_volume)
    @volume_or_quantity = quantity_or_volume
    @filled_or_occupied = 0
  end

  def print_vsego
    @volume_or_quantity
  end

  def print_ostalos
    @volume_or_quantity - @filled_or_occupied
  end
end