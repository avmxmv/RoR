# frozen_string_literal: true

module Validation
  def validate!
    raise 'Неверный формат номера поезда' if @number !~ /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/
  end

  def valid?
    validate!
    true
  rescue StandardError
    puts 'Попробуйте ещё раз'
    false
  end
end
