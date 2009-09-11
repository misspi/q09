# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class JsonDump
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    path = env['PATH_INFO']
    begin
      puts "JSON REQUEST #{path}: #{response.body}" if path =~ /.js/
    rescue
      puts "ERROR IN JSON DUMP: #{response.join('|')}" if response.respond_to?(:join)
    end
    [status, headers, response]
  end
end
