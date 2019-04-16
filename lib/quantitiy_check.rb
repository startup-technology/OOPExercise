class QuantityCheck
  def no_quantity(coke, dietcoke, tea)
    if ((kindOfDrink == Drink::COKE) && (coke == 0))
      @charge += i
      return nil
    elsif ((kindOfDrink == Drink::DIET_COKE) && (dietcoke == 0))
      @charge += i
      return nil
    elsif ((kindOfDrink == Drink::TEA) && (tea == 0))
      @charge += i
      return nil
    end
  end
end
