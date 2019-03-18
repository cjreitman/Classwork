class Static
  def initialize(app)
    @app = app
  end

  def call(env)
    path = "." + env["PATH_INFO"]
    begin
      body = File.read(path)
      Rack::Response.new([body], 200, {'Content-Type' => 'text/plain'})
    rescue => exception
      Rack::Response.new(["File not found"], 404, {'Content-Type' => 'text/plain'})
    end

  end
end


