# frozen_string_literal: true

require_relative 'files'
require_relative 'formatting'

module Display
  def self.print_welcome
    <<~HEREDOC

    Welcome to Hangman! Type '#{Formatting.red('quit')}' at any time if you wish to stop playing.
    While playing, enter '#{Formatting.blue('save')}' to save the current game to come back later.

    HEREDOC
  end

  def self.ask_load_previous
    <<~HEREDOC
    Would you like to load a previous game?
    Enter '#{Formatting.green('yes')}' or '#{Formatting.green('no')}': 
    HEREDOC
  end

  def self.current_save_files
    <<~HEREDOC

    Here are your current save files:
    #{Formatting.magenta(Formatting.bold(Files.all_files.join(' ')))}
    What is the file you would like to load?
    Enter a #{Formatting.cyan('file name')} or '#{Formatting.cyan('new')}' to start a new game: 
    
    HEREDOC
  end

  def self.random_word_chosen(letters)
    "Your random word has been chosen. It has #{Formatting.bold(Formatting.underline(letters))} letters."
  end

  def self.letter_input
    "Enter a #{Formatting.magenta('letter')} or \'#{Formatting.blue('save')}\': "
  end

  def self.saved_game_as
    'Saved game as: '
  end

  def self.play_again
    <<~HEREDOC
    Would you like to play again?
    Enter '#{Formatting.green('yes')}' or '#{Formatting.green('no')}': 
    HEREDOC
  end

  def self.yes_or_no_invalid
    "Invalid input. Enter \'#{Formatting.green('yes')}\', \'#{Formatting.green('no')}\', or \'#{Formatting.red('quit')}\'"
  end

  def self.file_invalid
    <<~HEREDOC
    Invalid filename. Enter a filename from the following file names.
    #{Formatting.magenta(Formatting.bold(Files.all_files.join(' ')))}
    Or type '#{Formatting.cyan('new')}' to start a new game or '#{Formatting.red('quit')}' to quit.
    HEREDOC
  end

  def self.letter_invalid
    "Invalid input. Enter a letter \'#{Formatting.blue('save')}\', or \'#{Formatting.red('quit')}\'."
  end

  def self.quit
    'Quitting... Thanks for playing!'
  end

  def self.no_saves
    'No saves available'
  end

  def self.no_guesses_remaining(word)
    <<~HEREDOC

    Out of guesses!
    The correct word was: #{Formatting.bold(Formatting.underline(word))}

    HEREDOC
  end

  def self.guessed_word(word)
    <<~HEREDOC

    #{Formatting.bold(Formatting.underline(word))}
    You correctly guessed the word!

    HEREDOC
  end

  def self.play_again
    <<~HEREDOC
    Would you like to play again?
    Enter '#{Formatting.green('yes')}' or '#{Formatting.green('no')}': 
    HEREDOC
  end

  def self.all_guesses(all_guesses, current_guess)
    formatted_string = ''
    all_guesses.each_char do |char|
      if current_guess.include?(char)
        formatted_string += "#{Formatting.green(char)}"
      else
        formatted_string += "#{Formatting.red(char)}"
      end
    end
    formatted_string
  end
end