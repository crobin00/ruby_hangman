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

valid_words = []

word_file = File.readlines('english-no-swears.txt', chomp: true)
word_file.each do |line|
  if line.length >= 5 && line.length <= 12
    valid_words.push(line)
  end
end

puts valid_words.sample
