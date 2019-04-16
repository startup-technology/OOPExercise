class VendingMachine
  def initialize
    @quantityOfCoke = 5 # コーラの在庫数
    @quantityOfDietCoke = 5 # ダイエットコーラの在庫数
    @quantityOfTea = 5 # お茶の在庫数
    @charge = 0 # お釣り
  end

  #  ジュースを購入する.
  # @param i           投入金額. 100円と500円のみ受け付ける.
  # @param kindOfDrink ジュースの種類.
  #                    コーラ({@code Juice.COKE}),ダイエットコーラ({@code Juice.DIET_COKE},お茶({@code Juice.TEA})が指定できる.
  # @return 指定したジュース. 在庫不足や釣り銭不足で買えなかった場合は {@code null} が返される.
  def buy(i, kindOfDrink)
    coin = Coin.new(i)
    money_box = MoneyBox.new
    @charge += 1 && (return nil) if coin.invalid? # 100円と500円だけ受け付ける

    if ((kindOfDrink == Drink::COKE) && (@quantityOfCoke == 0))
      @charge += coin
      return nil
    elsif ((kindOfDrink == Drink::DIET_COKE) && (@quantityOfDietCoke == 0))
      @charge += coin
      return nil
    elsif ((kindOfDrink == Drink::TEA) && (@quantityOfTea == 0))
      @charge += coin
      return nil
    end

    # 釣り銭不足
    if money_box.invalid?
      @charge += i
      return nil
    end

    if (coin == 100)
      # 100円玉を釣り銭に使える
      @numberOf100Yen += coin
    elsif (coin == 500)
      # 400円のお釣り
      @charge += (coin - 100)
      # 100円玉を釣り銭に使える
      @numberOf100Yen -= (coin - 100) / 100
    end

    if (kindOfDrink == Drink::COKE)
      @quantityOfCoke -= 1
    elsif (kindOfDrink == Drink::DIET_COKE)
      @quantityOfDietCoke -= 1
    else
      @quantityOfTea -= 1
    end

    return Drink.new(kindOfDrink)
  end

  # お釣りを取り出す.
  # @return お釣りの金額
  def refund()
    result = @charge
    @charge = 0
    result
  end
end



