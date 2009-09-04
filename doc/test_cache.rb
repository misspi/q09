
def create
  puts "Create!"
  "go"
end

def epa
  @s ||= create
end


10.times do 
  puts epa
end
