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

    until hangman.game_over?
      user_input = input
      puts
      break if user_input == 'quit'

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
      print 'Enter a letter: '
      user_input = gets.chomp.downcase
      return user_input if (user_input.length == 1 && alpha?(user_input)) || user_input == 'quit'

      puts 'Invalid input. Please enter one letter'
    end
  end

  def alpha?(char)
    (char >= 'a' && char <= 'z') ||
      (char >= 'A' && char <= 'Z')
  end
end
