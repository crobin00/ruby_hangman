# frozen_string_literal: true

# Module for formatting
module Formatting
  def self.red(string)
    "\e[31m#{string}\e[0m"
  end

  def self.green(string)
    "\e[32m#{string}\e[0m"
  end

  def self.blue(string)
    "\e[34m#{string}\e[0m"
  end

  def self.magenta(string)
    "\e[35m#{string}\e[0m"
  end

  def self.cyan(string)
    "\e[36m#{string}\e[0m"
  end

  def self.bold(string)
    "\e[1m#{string}\e[22m"
  end

  def self.underline(string)
    "\e[4m#{string}\e[24m"
  end

  def self.italic(string)
    "\e[3m#{string}\e[23m"
  end
end
