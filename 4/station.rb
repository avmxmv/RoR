class Station
  include All_st
  attr_accessor :trains

  @@kol = 0

  def initialize(name)
    @name = name
    @trains = []
    valid?
    @@kol += 1
  end

  def trains_by_type(type)
    trains.select { |el| el.type == type }
  end

  def count_trains_by_type(type)
    trains_by_type(type).count
  end

  private
  # я считаю что методы добавления и удаления должны быть приватными
  def validate!
    raise "Слишком длинное название" if name.length > 15
    raise "Слишком короткое название" if name.length < 3
  end

  def valid?
    validate!
    true
  rescue
    puts "Введите данные ещё раз"
    false
  end

  def set_train(train)
    @trains << train
  end

  def unset_train(train)
    trains.delete(train)
  end
end
