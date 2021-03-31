require "./lib/controller"

class Router
  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)

    controller.params = req.params

    if path == "/"
      controller.index
    elsif path == "/scan"
      controller.scan
    else 
      controller.not_found
    end
  end
end
