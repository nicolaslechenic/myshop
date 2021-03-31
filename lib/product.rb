require "sqlite3"

class Product
  def self.dbCnx
    @dbCnx ||= SQLite3::Database.new("./myshopDB.db")
    @dbCnx.results_as_hash = true
    @dbCnx
  end

  def self.all
    dbCnx.execute("SELECT name, price FROM products").map do |row|
      self.new(name: row["name"], price: row["price"])
    end
  end

  def self.find_by_name(name)
    product = dbCnx.execute("SELECT name, price FROM products WHERE name='#{name}' LIMIT 1").first

    self.new(name: product["name"], price: product["price"])
  end

  attr_reader :name, :price
  def initialize(name:, price:)
    @name = name
    @price = price
  end
end
