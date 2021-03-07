# require "./modules/braille_dictionaryable"

class NightWriter
  attr_reader :input_file,
              :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def start
    conversion
    file_characters = File.read(@output_file).length
    puts "Created '#{@output_file}' containing #{file_characters} characters"
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
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."],
      "." => ["..", "00", ".0"]
    }
  end

  def read_file
    read = File.read("#{@input_file}").downcase.chomp
    # require "pry"; binding.pry
    if read.length > 40
      array = read.chars.each_slice(40).map(&:join)
      x = array.map do |letter|
        letter.chars
      end
    else
      [read.chars]
    end
  end

  def conversion
      braille = read_file.map do |sliced_array|
        sliced_array.map do |letter|
          convert[letter]
        end
      end
      message = ""

      braille.each do |sliced_array|
        top = ""
        middle = ""
        bottom = ""
        sliced_array.each do |braille_array|
          top << braille_array[0]
          middle << braille_array[1]
          bottom << braille_array[2]
        end
        message += "#{top}\n#{middle}\n#{bottom}\n\n"
      end
      message
    end

    def show_change_in_output_file
      File.open("#{@output_file}", "w") {|fo| fo.write("#{conversion}") }
    end
  end
