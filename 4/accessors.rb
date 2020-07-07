# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history") { instance_variable_get("@#{name}_history") }
      define_method("#{name}=".to_sym) do |value|
        if instance_variable_get("@#{name}_history")
          instance_variable_get("@#{name}_history") << instance_variable_get(var_name)
        else
          instance_variable_set("@#{name}_history", [])
        end
        instance_variable_set(var_name, value)
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise "Неподходящий класс" if value.class != type
      instance_variable_set(var_name, value)
    end
  end
end
