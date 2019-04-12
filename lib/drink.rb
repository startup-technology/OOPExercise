class Drink
  COKE = 0
  DIET_COKE = 1
  TEA = 2

  def initialize(kind)
    @kind = kind
  end

  def getKind()
    return @kind
  end
end
