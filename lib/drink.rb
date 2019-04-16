class Drink
  COKE = 0
  DIET_COKE = 1
  TEA = 2

  def initialize(kind)
    @kind = kind
  end

  def kind
    @kind
  end

  def is_coke?
    self.kind == COKE
  end

  def is_diet_coke?
    self.kind == DIET_COKE
  end

  def is_tea?
    self.kind == TEA
  end
end
