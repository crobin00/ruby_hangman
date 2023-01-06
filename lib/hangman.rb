# frozen_string_literal: true

# Class for Hangman
class Hangman
  attr_accessor :valid_words, :current_word, :current_guess,
                :guesses_remaining, :all_guesses

  def initialize
    @valid_words = []
    read_all_valid_words
    @current_word = valid_words.sample.split('')
    @current_guess = Array.new(current_word.length, '-')
    @all_guesses = []
    @guesses_remaining = 7
    p current_word
  end

  def make_guess(user_input)
    found_letter = false
    all_guesses.push(user_input)
    # See if input in current word
    current_word.each_with_index do |char, idx|
      if char == user_input
        current_guess[idx] = char
        found_letter = true
      end
    end
    return true if found_letter

    self.guesses_remaining -= 1
    false
  end

  def game_over?
    guessed_word? || guesses_remaining.zero?
  end

  def guessed_word?
    current_guess == current_word
  end

  def previously_guessed?(user_input)
    all_guesses.include?(user_input)
  end

  def current_word_string
    current_word.join
  end

  def current_guess_string
    current_guess.join
  end

  def all_guesses_string
    all_guesses.join(' ')
  end

  private

  def read_all_valid_words
    word_file = File.readlines('english-no-swears.txt', chomp: true)
    word_file.each do |line|
      valid_words.push(line) if line.length >= 5 && line.length <= 12
    end
  end
end
