# require './message.txt'

class NightWriter

  def initialize(length = nil, file_name = nil)
    @length = length
    @file_name = file_name
  end

  def start
    puts "Welcome to night writer, how many words do you want to read?"
    user_input = gets.chomp
    new_file = File.open("braille.txt", "w+")
    puts "Created #{new_file} containing #{user_input} characters"
  end
end

# user_input = gets.chomp
# new_file = File.open(file_name, "w+")
#{|f| f.write("yoooo") } #For f.write argument,
# do I need to make a method to say whatever the size is, make a random word from that?
# puts "Created #{file_name} containing characters"

writer = NightWriter.new()
writer.start
