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
    File.open(@input, "r+") do |f|
      f.puts "#{@input_2}"
    end
    conversion
    file_characters = File.read(@input).length
    puts "Created '#{output_file}' containing #{file_characters} characters"
    read_file
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

  def read_file
    read = File.read("message.txt").split[0] #split 0 removes the \n
    if read.length > 80
      array = read.chars.each_slice(40).map(&:join)
      array.map do |letter|
        letter.chars
      end
    else
      read.chars
    end
  end

  def conversion

    # read = File.read("message.txt").split[0] #split 0 removes the \n
    # letters_to_array = read_file.chars #splits each letter into elements of array
    # require "pry"; binding.pry
    braille = read_file[0].map do |let|
       convert[let]
    end
    row1 = ""
    row2 = ""
    row3 = ""

    braille.each do |array|
      row1 << array[0]
      row2 << array[1]
      row3 << array[2]
    end
    message = "#{row1}\n#{row2}\n#{row3}"
    # require "pry"; binding.pry
  end

  def show_change_in_output_file
    File.open("braille.txt", "w") {|fo| fo.write("#{conversion}") }
  end
end


writer = NightWriter.new(@input, "braille.txt")
writer.start
