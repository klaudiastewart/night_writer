require './lib/braille_dictionary'

class NightWriter
  attr_reader :input_file,
              :output_file,
              :input,
              :input_2

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @input = ARGV[0]
    @input_2 = ARGV[1]
    require "pry"; binding.pry
  end

  def start
    # input = ARGV[0]
    # input_2 = ARGV[1]
    # require "pry"; binding.pry
    new_file = File.open("braille.txt", "w") do |fo|
      fo.puts "#{@input_2}"
    end
    puts "Created '#{output_file}' containing #{@input_2.length} characters"
  end

  def convert(letter)
    # require "pry"; binding.pry
  end
end


writer = NightWriter.new("message.txt", "braille.txt")
writer.start
