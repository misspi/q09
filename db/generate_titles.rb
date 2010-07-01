
Question.all.each do |q|
    puts "Question.apply_title('#{q.group}', '#{q.name}', '')"
end

