require "sqlite3"

class Product
  LIST = {
    "Bananes" => 150,
    "Cerises" => 75,
    "Apples" => 100,
    "Mele" => 100,
    "Pommes" => 100
  }.freeze

  def self.dbCnx
    @dbCnx ||= SQLite3::Database.new("./myshopDB.db")
    @dbCnx.results_as_hash = true
    @dbCnx
  end

  def self.list
    list = {}
    dbCnx.execute( "SELECT * FROM products" ) do |row|
      list[row["name"]] = row["price"]
    end
    list
  end

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def price
    LIST[@name]
  end
end
