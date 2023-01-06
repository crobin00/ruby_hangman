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

def get_all_words(valid_words_arr)
  word_file = File.readlines('english-no-swears.txt', chomp: true)
  word_file.each do |line|
    if line.length >= 5 && line.length <= 12
      valid_words_arr.push(line)
    end
  end
end

valid_words = []
get_all_words(valid_words)

current_word =  valid_words.sample.split('')
current_guess = Array.new(current_word.length, '-')
p current_word
while current_guess != current_word
  user_input = input

  current_word.each_with_index do |char, idx|
    if char == user_input
      current_guess[idx] = char
    end
  end
  p current_guess
end


