
class Simplex

  def self.jquery
    b = Simplex.new('$')
    yield b
    b
  end
  
  def initialize(base)
    @base = base
    @out = ""
  end
    
  def [](*args)
    @out << ";\n" if @out.length > 0
    print(false, @base, args)
  end
  
  def method_missing(name, *args)
    print(true, name, args)
  end
  
  def print(point, name, args)
    @out << "." if point && @out.length > 0
    @out << "#{name}(#{args.map() do |arg|
    arg.is_a?(Numeric) ? arg : "\"#{arg}\""
    end.join(',')})"
    return self
  end
  
  def to_s
    "#{@out};"
  end
end

