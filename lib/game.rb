# frozen_string_literal: true

require_relative 'hangman'

# Class for Game
class Game
  attr_reader :hangman

  def initialize
    @hangman = Hangman.new
  end

  def run
    until hangman.game_over?
      user_input = input
      puts
      break if user_input == 'quit'

      # If input in current guess or incorrect guesses, enter new char
      if hangman.previously_guessed?(user_input)
        puts 'You already guessed that letter. Try again.'
        next
      end

      if hangman.make_guess(user_input)
        puts 'Good guess!'
      else
        puts 'Incorrect guess.'
      end

      if hangman.amount_guesses_remaining == 1
        puts 'Last guess!'
      else
        puts "Incorrect guesses remaining: #{hangman.amount_guesses_remaining}"
      end

      # Guessed correct word
      if hangman.guessed_word?
        puts 'You guessed the word!'
        break
      end

      # Next iteration if not out of guesses else break
      next unless hangman.amount_guesses_remaining.zero?

      puts 'Out of guesses!'
      puts 'Correct word was:'
      puts hangman.current_word_string
      break
    end
  end

  private

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
