# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class JsonDump
   def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    path = env['PATH_INFO']
    puts "JSON REQUEST #{path}: #{response.body}" if path =~ /.js/
    [status, headers, response]
  end
end
