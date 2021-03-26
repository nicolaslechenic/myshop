require "./lib/cash_register"
require "./lib/product"

CHERRY_DISCOUNT = 20
MELE_DISCOUNT = 50
PRODUCTS = { 
  "Pommes" => 100,
  "Mele" => 100,
  "Apples" => 100,
  "Bananes" => 150,
  "Cerises" => 75
}

cash_register = CashRegister.new

ARGF.each do |argument|
  argument = argument.chomp
  return "oups" if argument == "quit"


  argument.split(',').each do |name|  
    name.strip!
    product = Product.new(name)
    cash_register << product
  end

  puts cash_register.total_without_discount - cash_register.discount
end
