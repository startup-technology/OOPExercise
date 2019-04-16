class Stock
  def initialize(value)
    @value = value
  end

  def empty?
    @value == 0
  end

  def pop
    @value -= 1
  end
end
