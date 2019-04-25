class Charge
  def initialize
    @charges = []
  end
  
  def push(money)
    @charges << money
  end
  
  def total_charge
    @charges.sum(&:money)
  end

  def reset_charges
    @charges = []
  end
end
