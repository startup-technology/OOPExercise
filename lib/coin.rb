class Coin
  def initialize(coin)
    @coin = coin
  end

  def valid?
    if ((@coin != 100) && (@coin != 500))
      false
    else
      true
    end
  end
end
