class ItemStock
  QUANTITY_OF_COKE = 5 # コーラの在庫数
  QUANTITY_OF_DIET_COKE = 5 # ダイエットコーラの在庫数
  QUANTITY_OF_TEA = 5 # お茶の在庫数

  def initialize(kindOfDrink)
    @kind_of_drink = kindOfDrink
    @quantity_of_item = if kindOfDrink == Drink::COKE
                          QUANTITY_OF_COKE
                        elsif kindOfDrink == Drink::DIET_COKE
                          QUANTITY_OF_DIET_COKE
                        elsif kindOfDrink == Drink::TEA
                          QUANTITY_OF_TEA
                        end
  end

  def kind_of_drink
    @kind_of_drink
  end

  def empty?
    if kind_of_drink == Drink::COKE
      QUANTITY_OF_COKE.zero?
    elsif kind_of_drink == Drink::COKE
      QUANTITY_OF_DIET_COKE.zero?
    elsif kind_of_drink == Drink::TEA
      QUANTITY_OF_TEA.zero?
    end
  end

  def calculate
    if kind_of_drink == Drink::COKE
      @quantity_of_item -= 1
    elsif kind_of_drink == Drink::DIET_COKE
      @quantity_of_item -= 1
    elsif kind_of_drink == Drink::TEA
      @quantity_of_item -= 1
    end
  end
end
