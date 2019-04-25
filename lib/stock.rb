class Stock

  def initialize(drink_name, num)
    @drink = drink_name
    @num = num
  end

  def decrease(n)
    @num -= n
  end

  def present?
    @num >= 1
  end

  def empty?
    @num == 0
  end
end