class Station
  attr_accessor :trains
  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_by_type(type)
    trains.select { |el| el.type == type }
  end

  def count_trains_by_type(type)
    trains_by_type(type).count
  end

  private 

  # я считаю что методы добавления и удаления должны быть приватными
  def set_train(train)
    @trains << train
  end

  def unset_train(train)
    trains.delete(train)
  end
end
