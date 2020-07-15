module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, options = nil)
      @validations ||= []
      @validations << { name: name, type: type, options: options }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:name]}")
        case validation[:type]
        when :presence
          raise "Нет значения" if value.nil? || value.empty?
        when :format
          raise 'Неверный формат' if value !~ validation[:options]
        when :type
          raise 'Неверный класс' if value.class != validation[:options]
        else
          puts "Неверные данные"
        end
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end