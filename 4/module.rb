# frozen_string_literal: true

module Admin
  class Name
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end
end

module Acсessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
    end
  end
end

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
