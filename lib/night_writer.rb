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
  end

  def start
    File.open("message.txt", "r+") do |f|
      f.puts "#{@input_2}"
    end
    conversion
    puts "Created '#{output_file}' containing #{@input_2.length} characters"
    show_change_in_output_file
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
      "p" => ["00", "0.", "0."],
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
  end

  def conversion
    read = File.read("message.txt").split[0] #split 0 removes the \n
    letters_to_array = read.chars #splits each letter into elements of array
    braille = letters_to_array.flat_map do |let|
      let = convert["p"] #hardcoded for now to see if it'll work
    end
    braille
    # require "pry"; binding.pry
  end

  def show_change_in_output_file
    out_file = File.new("braille.txt", "w")
    out_file.puts("#{conversion}")
    # File.open("braille.txt", "w") {|fo| fo.write("#{conversion}") }
    # require "pry"; binding.pry
  end
end


writer = NightWriter.new("message.txt", "braille.txt")
writer.start
