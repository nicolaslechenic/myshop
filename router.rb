require "./lib/controller"

class Router
  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)
    params = {}

    binding.pry
    # params.merge!(req.params)
    params.merge!(JSON.parse(req.body.read))
    

    controller.params = params
    
    case path
    when "/"
      controller.index
    when "/list"
      controller.list
    when "/add"
      binding.pry
      controller.add
    when "/clear"
      controller.clear
    else
      controller.not_found
    end 
  end
end
