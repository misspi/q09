# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class JsonDump
   def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    puts "JSON RESPONSE: #{response.body}" if env['PATH_INFO'] =~ /.js/
    [status, headers, response]
  end
end
