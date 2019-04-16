require './lib/drink'
require './lib/vending_machine'
require './lib/coin'

module Main
  class MyError < StandardError; end
  def main(input = STDIN, output = STDOUT)
    vm = VendingMachine.new
    while str = input.gets&.chomp
      unless str.match?(/\A\d+ (COKE|DIET_COKE|TEA)\z/)
        output.puts '`100 COKE`の形で入力してください'
        next
      end
      n, m = str.split(' ')

      payed_money = n.to_i
      ordered_drink = Drink.new(m)

      order = Order.new(payed_money, ordered_drink)
      payed_money = order.payed_money
      ordered_drink = order.ordered_drink

      drink = vm.buy(payed_money, ordered_drink)
      charge = vm.refund

      if drink != nil && drink.is_coke?
        output.puts 'コーラを購入しました'
        output.puts "おつりは#{charge}円です"
      elsif drink != nil && drink.is_diet_coke?
        output.puts 'ダイエットコーラを購入しました'
        output.puts "おつりは#{charge}円です"
      elsif drink != nil && drink.is_tea?
        output.puts 'お茶を購入しました'
        output.puts "おつりは#{charge}円です"
      else
        output.puts "おつりは#{charge}円です"
        raise MyError, '買えんかった(´ﾟдﾟ｀)'
      end
    end
    true
  end
end

if $PROGRAM_NAME == __FILE__
  include Main
  main
end
