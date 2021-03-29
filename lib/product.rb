class Product
  LIST = {
    "Bananes" => 150,
    "Cerises" => 75,
    "Apples" => 100,
    "Mele" => 100,
    "Pommes" => 100,
  }.freeze

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def price
    LIST[@name]
  end
end
