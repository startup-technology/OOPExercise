class Money
  YEN_COIN_100 = 100
  YEN_COIN_500 = 500

  def initialize(insertMoney)
    @insertMoney = insertMoney
  end

  def insertMoney
    @insertMoney
  end

  def available?
    (insertMoney != YEN_COIN_100) && (insertMoney != YEN_COIN_500)
  end
end
