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
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"]
    }
  end

  def conversion
    read = File.read("message.txt").split[0] #split 0 removes the \n
    letters_to_array = read.chars #splits each letter into elements of array
    braille = letters_to_array.flat_map do |let|
       convert[let]
    end
    top = braille[0]
    middle = braille[1]
    bottom = braille[2]
    message = "#{top}\n#{middle}\n#{bottom}"
    # require "pry"; binding.pry
  end

  def show_change_in_output_file
    File.open("braille.txt", "w") {|fo| fo.write("#{conversion}") }
  end
end


writer = NightWriter.new("message.txt", "braille.txt")
writer.start
