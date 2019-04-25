require './lib/charge'

class VendingMachine
  def initialize
    @quantityOfCoke = 5 # コーラの在庫数
    @quantityOfDietCoke = 5 # ダイエットコーラの在庫数
    @quantityOfTea = 5 # お茶の在庫数
    @numberOf100Yen = 10 # 100円玉の在庫
    @charges= Charge.new # お釣り
  end

  #  ジュースを購入する.
  # @param insert_coin           投入金額. 100円と500円のみ受け付ける.
  # @param kindOfDrink ジュースの種類.
  #                    コーラ({@code Juice.COKE}),ダイエットコーラ({@code Juice.DIET_COKE},お茶({@code Juice.TEA})が指定できる.
  # @return 指定したジュース. 在庫不足や釣り銭不足で買えなかった場合は {@code null} が返される.
  def buy(insert_coin, kindOfDrink)
    # 100円と500円だけ受け付ける
    if !insert_coin.valid?
      @charges.push(insert_coin)
      return nil
    end

    if ((kindOfDrink == Drink::COKE) && (@quantityOfCoke == 0))
      @charges.push(insert_coin)
      return nil
    elsif ((kindOfDrink == Drink::DIET_COKE) && (@quantityOfDietCoke == 0))
      @charges.push(insert_coin)
      return nil
    elsif ((kindOfDrink == Drink::TEA) && (@quantityOfTea == 0))
      @charges.push(insert_coin)
      return nil
    end

    # 釣り銭不足
    if (insert_coin.is_500yen? && @numberOf100Yen < 4)
      @charges.push(insert_coin)
      return nil
    end

    if insert_coin.is_100yen?
      # 100円玉を釣り銭に使える
      @numberOf100Yen += 1
    elsif insert_coin.is_500yen?
      # 400円のお釣り
      @charges.push(insert_coin.money - 100)
      # 100円玉を釣り銭に使える
      @numberOf100Yen -= (insert_coin.money - 100) / 100
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
    result = @charges.total_charge
    @charges.reset_charges
    result
  end
end
