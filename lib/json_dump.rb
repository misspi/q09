# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class JsonDump
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    path = env['PATH_INFO']
    puts "JSON LOG - path #{path}"
    begin
      if path =~ /.js/
        body = response.respond_to?(:body) ? response.body : response.to_s
        puts "JSON REQUEST #{path}: #{body}"
      end
    rescue Exception => e
      error  = " - #{e.message}"
      error << response.join('|') if response.respond_to?(:join)
      puts "ERROR IN JSON DUMP: #{error}"
    end
    [status, headers, response]
  end
end
