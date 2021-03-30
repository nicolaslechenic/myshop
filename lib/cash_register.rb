class CashRegister
  CHERRY_DISCOUNT = 20
  MELE_DISCOUNT = 50

  attr_reader :products, :counter
  def initialize
    @products = []
    @counter = {}

    Product::all.each { |product| @counter[product.name] = 0 }
  end

  def total
    total_without_discount - discount
  end

  def clear
    @products = []
    Product::all.each { |product| @counter[product.name] = 0 }
  end

  def <<(product)
    @counter[product.name] += 1
    @products << product
  end

  private

  def discount
    (discount_cherries + discount_bananas +
      discount_apples_en + discount_apples_it)
  end

  def discount_cherries
    0
    #@counter["Cerises"] / 2 * CHERRY_DISCOUNT
  end

  def discount_bananas
    0
    #@counter["Bananes"] / 2 * Product::find_by_name("Bananes")
  end

  def discount_apples_en
    0
    #@counter["Apples"] / 3 *  Product::find_by_name("Apples")
  end

  def discount_apples_it
    0
   # @counter["Mele"] / 2 * MELE_DISCOUNT
  end

  def total_without_discount
    @products.map(&:price).sum
  end
end
