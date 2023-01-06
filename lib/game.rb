# frozen_string_literal: true

require_relative 'hangman'

# Class for Game
class Game
  attr_reader :hangman

  def initialize
    @hangman = Hangman.new
  end

  def run
    while hangman.current_guess != hangman.current_word
      user_input = input
      break if user_input == 'q'

      # If input in current guess or incorrect guesses, enter new char
      if hangman.previously_guessed?(user_input)
        puts 'You already guessed that letter. Try again.'
        next
      end

      puts 'Incorrect guess' unless hangman.make_guess(user_input)
    end
  end

  private

  def input
    loop do
      user_input = gets.chomp.downcase
      return user_input if user_input.length == 1 && alpha?(user_input)

      puts 'Invalid input. Please enter one letter'
    end
  end

  def alpha?(char)
    (char >= 'a' && char <= 'z') ||
      (char >= 'A' && char <= 'Z')
  end
end
