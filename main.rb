# frozen_string_literal: true

def alpha?(char)
  (char >= 'a' && char <= 'z') ||
    (char >= 'A' && char <= 'Z')
end

def input
  loop do
    user_input = gets.chomp
    return user_input if user_input.length == 1 && alpha?(user_input)

    puts 'Invalid input. Please enter one letter'
  end
end

puts input
