require "./lib/controller"

class Router
  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params

    controller.params = params
    
    case path
    when "/"
      controller.index
    when "/add"
      controller.add
    when "/clear"
      controller.clear
    else
      controller.not_found
    end 
  end
end