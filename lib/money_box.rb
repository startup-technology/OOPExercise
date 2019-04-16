class MoneyBox
  def initialize
    @numberOf100Yen = 10 # 100円玉の在庫
  end
  
  def invalid?(coin)
    (coin == 500 && @numberOf100Yen < 4)
  end
end
