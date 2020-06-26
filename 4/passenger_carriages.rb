# frozen_string_literal: true

require_relative 'carriages'

class PassengerCarriage < Carriage
  def reservation
    if @filled_or_occupied + 1 <= @volume_or_quantity
      @filled_or_occupied += 1
    else
      puts 'Все места заняты'
    end
  end
end
