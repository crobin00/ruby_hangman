# frozen_string_literal: true

require_relative 'hangman'

# Class for Game
class Game
  attr_reader :hangman

  def initialize
    @hangman = Hangman.new
  end

  def run
    print_welcome

    file = load_game
    if file
      hangman.load_game(file)
      print_all_guesses
      print_guesses_remaining
    else
      puts 'Your random word has been chosen'
    end

    print_current_guess

    until hangman.game_over?
      user_input = input
      puts
      break if user_input == 'quit'

      if user_input == 'save'
        hangman.save_game
        break
      end

      # If input in current guess or incorrect guesses, enter new char
      if hangman.previously_guessed?(user_input)
        puts 'You already guessed that letter. Try again.'
        next
      end

      print_guess_feedback(user_input)

      # Guessed correct word
      if hangman.guessed_word?
        puts 'You guessed the word!'
        break
      end

      # Break if out of guesses
      if hangman.guesses_remaining.zero?
        print_out_of_guesses
        break
      end

      print_all_guesses
      print_guesses_remaining
      print_current_guess
    end
  end

  private

  def print_welcome
    puts 'Welcome to Hangman! Type \'quit\' at any time if you wish to stop playing.'
  end

  def print_all_guesses
    puts "Letters guessed: #{hangman.all_guesses_string}"
  end

  def print_current_guess
    puts hangman.current_guess_string
  end

  def print_guess_feedback(user_input)
    if hangman.make_guess(user_input)
      puts 'Good guess!'
    else
      puts 'Incorrect guess!'
    end
  end

  def print_out_of_guesses
    puts 'Out of guesses!'
    puts 'Correct word was:'
    puts hangman.current_word_string
  end

  def print_guesses_remaining
    if hangman.guesses_remaining == 1
      puts 'Last guess!'
    else
      puts "Incorrect guesses remaining: #{hangman.guesses_remaining}"
    end
  end

  def input
    loop do
      print 'Enter a letter or \'save\' to save current game: '
      user_input = gets.chomp.downcase
      return user_input if (user_input.length == 1 && alpha?(user_input)) ||
                           user_input == 'quit' || user_input == 'save'

      puts 'Invalid input. Please enter one letter'
    end
  end

  def load_game
    loop do
      puts 'Would you like to load a previous game?'
      print 'Enter \'yes\' or \'no\': '
      user_input = gets.chomp.downcase
      return false if user_input == 'no'  
      return get_file if user_input == 'yes'
      puts 'Invalid input.'
    end
  end

  def get_file
    files_names = []
    if Dir.empty?('saves')
      puts 'No saves available'
      return false
    end

    puts 'Files: '
    Dir.each_child('saves') do |file|
      base_name = File.basename(file, '.yaml')
      files_names.push(base_name)
      puts base_name
    end

    loop do
      print 'What is the file name?'
      user_input = gets.chomp.downcase
      return user_input if files_names.include?(user_input)

      puts 'Invalid file.'
    end
  end

  def alpha?(char)
    (char >= 'a' && char <= 'z') ||
      (char >= 'A' && char <= 'Z')
  end
end
