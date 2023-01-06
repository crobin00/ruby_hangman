# frozen_string_literal: true

# Class for Hangman
class Hangman
  attr_accessor :valid_words, :current_word, :current_guess,
                :guessed_incorrect_letters, :guesses_remaining

  def initialize
    @valid_words = []
    read_all_valid_words
    @current_word = valid_words.sample.split('')
    @current_guess = Array.new(current_word.length, '-')
    @guessed_incorrect_letters = []
    @guesses_remaining = 7
    p current_word
  end

  def make_guess(user_input)
    found_letter = false
    # See if input in current word
    current_word.each_with_index do |char, idx|
      if char == user_input
        current_guess[idx] = char
        found_letter = true
      end
    end
    return true if found_letter

    # If letter not found, add to incorrect letters
    guessed_incorrect_letters.push(user_input)
    false
  end

  def game_over?
    guessed_word? || amount_guesses_remaining.zero?
  end

  def guessed_word?
    current_guess == current_word
  end

  def previously_guessed?(user_input)
    current_guess.include?(user_input) || guessed_incorrect_letters.include?(user_input)
  end

  def amount_guesses_remaining
    guesses_remaining - guessed_incorrect_letters.length
  end

  def current_word_string
    @current_word.join('')
  end

  private

  def read_all_valid_words
    word_file = File.readlines('english-no-swears.txt', chomp: true)
    word_file.each do |line|
      valid_words.push(line) if line.length >= 5 && line.length <= 12
    end
  end
end
