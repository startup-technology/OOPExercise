class Coin
  def initialize(coin)
    @coin = coin
  end

  def coin
    @coin
  end

  def is_500Yen?
    @coin == 500
  end

  def is_100Yen?
    @coin == 100
  end

  def invalid?
    !is_500Yen? && !is_100Yen?
  end
end
