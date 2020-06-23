require_relative 'carriages'

class PassengerCarriage < Carriage
  attr_accessor :quantity
  attr_accessor :quantity_occupied

  def initialize(quantity)
    @quantity = quantity
    @quantity_occupied = 0
  end

  def reservation
    @quantity_occupied += 1
  end

  def kol_reservation
    @quantity_occupied
  end

  def kol_free_sits
    @quantity - @quantity_occupied
  end
end