# frozen_string_literal: true

require_relative 'display'

module Files
  def self.all_files
    file_names = []
    if !Dir.exist?('saves') || Dir.empty?('saves')
      puts Display.no_saves
      return file_names
    end

    Dir.each_child('saves') do |file|
      base_name = File.basename(file, '.yaml')
      file_names.push(base_name)
    end
    file_names
  end
end
