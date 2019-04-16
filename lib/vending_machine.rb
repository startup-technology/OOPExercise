class VendingMachine
  def initialize
    @quantityOfCoke = Stock.new(5) # コーラの在庫数
    @quantityOfDietCoke = Stock.new(5) # ダイエットコーラの在庫数
    @quantityOfTea = Stock.new(5) # お茶の在庫数
    @quantitiOfDrink = {}
    @charge = 0 # お釣り
  end

  #  ジュースを購入する.
  # @param inserted_money           投入金額. 100円と500円のみ受け付ける.
  # @param kindOfDrink ジュースの種類.
  #                    コーラ({@code Juice.COKE}),ダイエットコーラ({@code Juice.DIET_COKE},お茶({@code Juice.TEA})が指定できる.
  # @return 指定したジュース. 在庫不足や釣り銭不足で買えなかった場合は {@code null} が返される.
  def buy(inserted_money, kindOfDrink)
    coin = Coin.new(i)
    money_box = MoneyBox.new
    drink = Drink.new(kindOfDrink)
    money_box.charge(inserted_money) && (return nil) if coin.invalid? # 100円と500円だけ受け付ける
    # @charge += i && (return nil) if coin.invalid? # 100円と500円だけ受け付ける

    if ((drink.is_coke?) && (@quantityOfCoke.empty?))
      money_box.add_charge(inserted_money)
      return nil
    end
    if ((drink.is_diet_coke?) && (@quantityOfDietCoke.empty?))
      money_box.add_charge(inserted_money)
      return nil
    end
    if ((drink.is_tea?) && (@quantityOfTea.empty?))
      money_box.add_charge(inserted_money)
      return nil
    end

    # 釣り銭不足
    if coin.is_500Yen? && money_box.has_enough_money?(inserted_money)
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

    if (drink.is_coke?)
      @quantityOfCoke.pop
    elsif (drink.is_diet_coke?)
      @quantityOfDietCoke.pop
    else
      @quantityOfTea.pop
    end

    return drink
  end

  # お釣りを取り出す.
  # @return お釣りの金額
  def refund()
    result = money_box.charge
    money_box.clear
    result
  end
end



