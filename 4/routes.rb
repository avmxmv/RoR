class Route
  attr_accessor :middle_st
  attr_reader :first
  attr_reader :last

  def initialize(first, last)
    @first = first
    @last = last
    @middle_st = []
  end

  def all_st
    @first
    @middle_st
    @last
  end

  private

  # я считаю что методы добавления и удаления должны быть приватными
  def add_st(station)
    middle_st << station
  end

  def del_st(station)
    middle_st.delete(station)
  end
end