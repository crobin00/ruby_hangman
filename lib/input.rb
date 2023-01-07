# frozen_string_literal: true

require_relative 'display'
require_relative 'files'

# Module for input
module Input
  def self.yes_or_no
    user_input = ''
    loop do
      user_input = gets.chomp.downcase
      break if %w[yes no quit].include?(user_input)

      puts Display.yes_or_no_invalid
    end
    user_input
  end

  def self.load
    user_input = ''
    loop do
      user_input = gets.chomp.downcase
      break if Files.all_files.include?(user_input) || user_input == 'new' || user_input == 'quit'

      puts Display.file_invalid
    end
    user_input
  end

  def self.letter_input
    user_input = ''
    loop do
      user_input = gets.chomp.downcase
      break if (user_input.length == 1 && alpha?(user_input)) ||
               user_input == 'quit' || user_input == 'save'

      puts Display.letter_invalid
    end
    user_input
  end

  def self.alpha?(char)
    (char >= 'a' && char <= 'z') ||
      (char >= 'A' && char <= 'Z')
  end
end
