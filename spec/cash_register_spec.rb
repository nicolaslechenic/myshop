require "spec_helper"
require "product"
require "cash_register"

RSpec.describe CashRegister do
  it "return the expected count of products" do
    cr = CashRegister.new

    cr << Product.new("Pommes")
    expect(cr.products.count).to eql(1)

    cr << Product.new("Cerises")
    expect(cr.products.count).to eql(2)
  end

  describe "#total" do
    it "return zero for new instance" do
      cr = CashRegister.new
      expect(cr.total).to eql(0)
    end
    
    it "return the expected total without discount" do
      cr = CashRegister.new

      cr << Product.new("Pommes")
      cr << Product.new("Cerises")

      expect(cr.total).to eql(175)
    end

    it "return the expected total with discounts" do
      cr = CashRegister.new

      %w(Mele Apples Apples Pommes Apples Mele Cerises Cerises).each do |fruit|
        cr << Product.new(fruit)
      end

      expect(cr.total).to eql(580)
    end
  end

  describe "#clear" do
    it "return the expected total without discount" do
      cr = CashRegister.new

      cr << Product.new("Pommes")
      cr << Product.new("Cerises")

      cr.clear

      expect(cr.total).to eql(0)
    end
  end
end
