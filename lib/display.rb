# frozen_string_literal: true

require_relative 'files'

module Display
  def self.print_welcome
    <<~HEREDOC
    Welcome to Hangman! Type 'quit' at any time if you wish to stop playing.
    While playing, enter 'save' to save the current game to come back later.
    HEREDOC
  end

  def self.ask_load_previous
    <<~HEREDOC
    Would you like to load a previous game?
    Enter 'yes' or 'no': 
    HEREDOC
  end

  def self.current_save_files
    <<~HEREDOC
    Here are your current save files:
    #{Files.all_files.join(' ')}
    What is the file you would like to load?
    Enter file name or \'new\' to start a new game: 
    HEREDOC
  end

  def self.random_word_chosen(letters)
    puts "Your random word has been chosen It has #{letters} letters."
  end

  def self.letter_input
    'Enter a letter or \'save\': '
  end

  def self.saved_game_as
    'Saved game as: '
  end

  def self.play_again
    <<~HEREDOC
    Would you like to play again?
    Enter 'yes' or 'no': 
    HEREDOC
  end

  def self.yes_or_no_invalid
    'Invalid input. Enter \'yes\', \'no\', or \'quit\''
  end

  def self.file_invalid
    <<~HEREDOC
    Invalid filename. Enter a filename from the following file names.
    #{Files.all_files.join(' ')}
    Or type 'new' to start a new game or 'quit' to quit.
    HEREDOC
  end

  def self.letter_invalid
    'Invalid input. Enter a letter \'save\', or \'quit\'.'
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
    The correct word was: #{word}
    HEREDOC
  end

  def self.guessed_word
    'You correctly guessed the word!'
  end

  def self.play_again
    <<~HEREDOC
    Would you like to play again?
    Enter 'yes' or 'no': 
    HEREDOC
  end
end