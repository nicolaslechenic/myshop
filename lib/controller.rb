require "tilt"
require "erb"

require "pry"

require "./lib/cash_register"
require "./lib/product"


class Controller
  attr_accessor :params

  def index
    total = cash_register.total
    products = cash_register.products

    render "index", total: total, products: products
  end

  def scan  
    params["fruits"].split(",").each do |name|
      name.strip!
      product = Product.new(name)
      cash_register << product
    end

    redirect "/"
  end

  def not_found
    template = Tilt.new("not_found.html.erb")

    [404, {"Content-Type" => "text/html"}, template.render]
  end

  private

  def cash_register
    # memoization
    @cash_register ||= CashRegister.new
  end

  def render(target, **view_params)
    template = Tilt.new("#{target}.html.erb")

    [code, {"Content-Type" => "text/html"}, template.render(self, view_params)]
  end

  def redirect(to)
    [302, {"Location" => to}, []]
  end
end