require "./lib/cash_register"
require "./lib/product"

cash_register = CashRegister.new

ARGF.each do |argument|
  argument = argument.chomp
  break if argument == "quit"

  argument.split(",").each do |name|
    name.strip!
    product = Product.new(name)
    cash_register << product
  end

  puts cash_register.total
end
