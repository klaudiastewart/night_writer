# require './message.txt'

# puts 'hello world'

File.open("braille.txt", "w+") {|f| f.write("strangeworld") }

# puts "Created "" containing 256 characters" #use string interpolation
