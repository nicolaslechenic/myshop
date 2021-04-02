require "json"
require "tilt"
require "erb"

require "./lib/cash_register"
require "./lib/product"

class Controller
  attr_accessor :params

  def index
    @products = cash_register.products
    @total = cash_register.total
    @list = Product::all

    @list = @list.map { |l| {"name" => l.name, "price" => l.price} }
    @products = @products.map { |l| {"name" => l.name, "price" => l.price} }

    render_json({ products: @products, total: @total, list: @list })
  end

  def list
    @products = Product::all

    render_json({ products: @products })
  end

  def add
    arguments = params["fruits"]

    arguments.split(",").each do |name|
      name.strip!
      product = Product::find_by_name(name)
      cash_register << product
    end

    render_json({})
  end

  def clear
    cash_register.clear

    redirect("/")
  end

  def not_found
    render({}, 404)
  end

  private

  def cash_register
    @cash_register ||= CashRegister.new
  end

  def render(params, code=200)
    file = caller_locations(1,1)[0].label
    template = Tilt.new("./lib/views/#{file}.html.erb")

    [
      code, 
      {"Content-Type" => "text/html"}, 
      template.render(
        self, 
        params
      )
    ]  
  end

  def render_json(params, code=200)
    [
      code, 
      {"Content-Type" => "application/json"}, 
      [params.to_json]
    ]  
  end

  def redirect(to)
    [302, {'Location' => to}, []]
  end
end
