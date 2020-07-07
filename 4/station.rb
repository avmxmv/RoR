# frozen_string_literal: true
# rubocop:disable all

class Station
  include Validation

  attr_accessor :trains
  attr_accessor :name

  validate :name, :presence

  @kol = 0

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @kol += 1
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
end
