class MoneyBox
  def initialize
    @charge = 0
    @numberOf100Yen = 10 # 100円玉の在庫
  end
  
  def invalid?(inserted_money)
    (inserted_money == 500 && @numberOf100Yen < 4)
  end

  def has_enough_money?(money)
    @numberOf100Yen < foo(money)
  end


  def foo(money)
    money / 100
  end

  def add_charge(charge)
    @charge += charge
  end

  def charge
    @charge
  end

  def clear
    @charge = 0
  end
end
