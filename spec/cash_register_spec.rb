require "spec_helper"
require "product"
require "cash_register"

RSpec.describe CashRegister do
  it "return the expected count of products" do
    cr = CashRegister.new
    apple = Product.new("Pommes")
    cherry = Product.new("Cerises")

    cr << apple

    expect(cr.products.count).to eql(1)

    cr << cherry

    expect(cr.products.count).to eql(2)
  end

  describe "#total" do
    it "return the expected total without discount" do
      cr = CashRegister.new
      apple = Product.new("Pommes")
      cherry = Product.new("Cerises")

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
end
