require "./lib/controller"
require "pry"


class Router
  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)
    body = req.body.gets
    params = {}

    params.merge!(req.params)
    params.merge!(body ? JSON.parse(body) : {}) if req.params.empty?

    controller.params = params
    
    case path
    when "/"
      controller.index
    when "/list"
      controller.list
    when "/add"
      controller.add
    when "/clear"
      controller.clear
    else
      controller.not_found
    end 
  end
end
