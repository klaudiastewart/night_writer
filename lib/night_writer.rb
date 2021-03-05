# require './lib/message'

class NightWriter
  attr_reader :input_file,
              :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def start
    input = ARGV 
    # require "pry"; binding.pry
    new_file = File.open("braille.txt", "w") do |fo|
      fo.puts "#{input[1]}"
    end
    puts "Created '#{input_file}' containing #{input[1].length} characters"
  end
end


writer = NightWriter.new("message.txt", "braille.txt")
writer.start
