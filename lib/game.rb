# frozen_string_literal: true

require_relative 'hangman'
require_relative 'display'
require_relative 'input'
require_relative 'files'

# Class for Game
class Game
  attr_reader :hangman, :user_input

  def initialize
    @hangman = Hangman.new
    @user_input = ''
  end

  def run
    puts Display.print_welcome
    puts Display.ask_load_previous
    user_input = Input.yes_or_no
    if user_input == 'quit'
      puts Display.quit
      return
    end

    if user_input == 'yes'
      unless Files.all_files.empty?
        puts Display.current_save_files
        user_input = Input.load
        case user_input
        when 'quit'
          puts Display.quit
          return
        when 'new'
          puts Display.random_word_chosen(hangman.current_word_string.length)
        else
          hangman.load_game(user_input)
        end
      end
    else
      puts Display.random_word_chosen(hangman.current_word_string.length)
    end

    until hangman.game_over?
      puts game_state
      puts Display.letter_input
      user_input = Input.letter_input
      case user_input
      when 'quit'
        puts Display.quit
        return
      when 'save'
        hangman.save_game
        return
      else
        hangman.make_guess(user_input)
      end
    end

    puts Display.no_guesses_remaining(hangman.current_word_string) if hangman.guesses_remaining.zero?
    puts Display.guessed_word if hangman.guessed_word?

    puts Display.play_again
    user_input = Input.yes_or_no
    run if user_input == 'yes'
    puts Display.quit if user_input == 'no'
  end

  def game_state
    puts hangman.current_guess_string
    puts "Letters guessed: #{hangman.all_guesses_string}"
    if hangman.guesses_remaining == 1
      puts 'Last guess!'
    else
      puts "Incorrect guesses remaining: #{hangman.guesses_remaining}"
    end
  end
end
