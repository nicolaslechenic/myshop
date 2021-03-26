require "spec_helper"
require "product"

RSpec.describe Product do
  describe "#price" do
    it "return the expected price for apple" do
      apple = Product.new("Pommes")
      expect(apple.price).to eql(100)
    end

    it "return the expected price for cherry" do
      cherry = Product.new("Cerises")
      expect(cherry.price).to eql(75)
    end

    it "return the expected price for banana" do
      banana = Product.new("Bananes")
      expect(banana.price).to eql(150)
    end
  end
end
