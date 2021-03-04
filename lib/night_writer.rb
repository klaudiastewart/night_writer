# require './message.txt'

# puts 'hello world'


class Writer

  def initialize()
  end

  def start
    puts "Welcome to night writer, how many words do you want to read?"
    user_input = gets.chomp
    puts user_input
    if user_input == Integer
      puts 'hi'
    end
  end
end

writer = Writer.new
writer.start

# user_input = gets.chomp
new_file = File.open("braille.txt", "w+") {|f| f.write("yoooo") } #For f.write argument,
# do I need to make a method to say whatever the size is, make a random word from that?
puts "Created 'braille.txt' containing characters"
