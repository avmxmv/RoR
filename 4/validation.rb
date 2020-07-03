# frozen_string_literal: true

module Validation
  def validate!(type)
    case type
    when 'train'
      raise 'Неверный формат номера поезда' if @number !~ /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/
    when 'station'
      raise 'Слишком длинное название' if name.length > 15
      raise 'Слишком короткое название' if name.length < 3
    when 'route'
      raise 'Недостаточно станций' if !first.nil? && !last.nil?
    else
      puts 'Попробуйте ещё раз'
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    puts 'Попробуйте ещё раз'
    false
  end
end
