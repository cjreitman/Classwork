require 'erb'
require 'byebug'

class ShowExceptions
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)

    req = Rack::Request.new(env)
    res = Rack::Response.new

    begin
      app.call(env)
    rescue => exception
      render_exception(exception)
    end

  end

  private

  def render_exception(e)

    @error = e.message
    body = ERB.new(File.read('lib/templates/rescue.html.erb')).result(binding)
    ['500', {'Content-type' => 'text/html'}, body]
  end

end
