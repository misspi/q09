require 'singleton'
require 'erb'
require 'ostruct'

class JSInline
  include Singleton
  
  def initialize
    @partials = {}
  end
  
  def self.inline(name, params)
    JSInline.instance.process(name, params)
  end

  if RAILS_ENV == 'development'
    def get_partial(name)
      @partials[name] = ERB.new(load_file(name), 0, "%<>")
    end
  else
    def get_partial(name)
      @partials[name] ||= ERB.new(load_file(name), 0, "%<>")
    end
  end

  def process(name, params)
    get_partial(name).result bind(params)
  end

    
  private
  def bind(params)
    object = Object.new
    object.instance_eval("def binding_for(#{params.keys.join(",")}) binding end")
    object.binding_for(*params.values)
  end
  
  def load_file(name)
    path = File.join(RAILS_ROOT, 'public/javascripts/inline', "#{name}.erb.js")
    if File.exists? path
      File.readlines(path).join('')
    else
      "jsinline ''#{path}' not found!"
    end
  end
end