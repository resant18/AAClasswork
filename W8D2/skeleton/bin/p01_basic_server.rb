require 'rack'

rack_app = Proc.new do |env| 
    rack_req = Rack::Request.new(env)
    rack_res = Rack::Response.new
    # default status is 200
    # meeseeks = BaseController.new(rack_req, rack_res)
    # meeseeks.execute 
    rack_res['Content-Type'] = "text/text"
    rack_res.write('Helloww World')
    rack_res.finish
end

Rack::Server.start(
    app: rack_app, 
    Port: 3000
)

