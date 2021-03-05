# require './lib/message'

class NightWriter
  attr_reader :file_name_text

  def initialize(file_name_text)
    @file_name_text = file_name_text
  end

  def start
    user_input = gets.chomp #need to get this to read the length of message.txt
    new_file = File.open("braille.txt", "w")
    puts "Created '#{file_name_text}' containing #{user_input.length} characters"
  end
end


writer = NightWriter.new("braille.txt")
writer.start
