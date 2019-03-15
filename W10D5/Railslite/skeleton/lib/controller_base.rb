require 'active_support'
require 'active_support/inflector'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
  end
    
  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "already built response" if already_built_response?
    @res['Location'] = url
    @res.status = 302
    @already_built_response = true
    session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "already built response" if already_built_response?
    @res['Content-Type'] = content_type
    @res.write(content)
    @already_built_response = true
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.to_s
    controller_name = controller_name.underscore
    dir_append = "/../views/#{controller_name}/#{template_name}.html.erb"
    outer_directory = File.dirname(__FILE__) 
    final_dir = outer_directory.concat(dir_append) 
    erb_file = ERB.new(File.read(final_dir)) 
    bound = erb_file.result(binding)
    render_content(bound, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    send(name)
    render name
  end
end

