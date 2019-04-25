class Coin
  def initialize(insert_money)
    @money = insert_money
  end
  
  def money
    @money
  end

  def valid?
   is_100yen? || is_500yen?
  end

  def is_100yen?
    @money == 100
  end

  def is_500yen?
    @money == 500
  end
end
