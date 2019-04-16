class Coin
  def initialize(coin)
    @coin = coin
  end

  def coin
    @coin
  end

  def invalid?
    self.coin != 100 && self.coin != 500
  end
end
