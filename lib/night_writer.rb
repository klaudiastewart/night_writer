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
    # require "pry"; binding.pry
  end

  def start
    File.open("message.txt", "r+") do |f|
      f.puts "#{@input_2}"
    end
    File.open("braille.txt", "w") {|fo| fo.write("#{@input_2}") }
    puts "Created '#{output_file}' containing #{@input_2.length} characters"
    convert
  end

  def convert
    english_letter_to_braille_symbol = {
      "a" => "0.....",
      "b" => "0.0...",
      "c" => "00....",
      "d" => "00.0..",
      "e" => "0..0..",
      "f" => "000...",
      "g" => "0000..",
      "h" => "0.00..",
      "i" => ".00...",
      "j" => ".000..",
      "k" => "0...0.",
      "l" => "0.0.0.",
      "m" => "00..0.",
      "n" => "00.00.",
      "o" => "0..00.",
      "p" => "000.0..",
      "q" => "00000.",
      "r" => "0.000.",
      "s" => ".00.0.",
      "t" => ".0000.",
      "u" => "0...00",
      "v" => "0.0.00",
      "w" => ".000.0",
      "x" => "00..00",
      "y" => "00.000",
      "z" => "0..000"
    }
    # require "pry"; binding.pry
  end

  def conversion

  end

end


writer = NightWriter.new("message.txt", "braille.txt")
writer.start
