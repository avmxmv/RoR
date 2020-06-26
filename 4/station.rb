# frozen_string_literal: true

class Station
  include AllStation
  attr_accessor :trains
  attr_accessor :name

  @@kol = 0

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@kol += 1
  end

  def trains_by_type(type)
    trains.select { |el| el.type == type }
  end

  def count_trains_by_type(type)
    trains_by_type(type).count
  end

  def set_train(train)
    @trains << train
  end

  def unset_train(train)
    trains.delete(train)
  end

  def each_train(&block)
    @trains.each do |el|
      block.call(el)
    end
  end

  private

  def validate!
    raise 'Слишком длинное название' if name.length > 15
    raise 'Слишком короткое название' if name.length < 3
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
