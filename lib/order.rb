class Order
  def initialize(money, ordered_drink)
    @money = money
    @drink = ordered_drink
  end

  def payed_money
    @money
  end

  def ordered_drink
    @drink
  end
end
