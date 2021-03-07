class NightReader
  attr_reader :input_file,
              :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def start
    read_file
    file_characters = File.read(@input_file).length / 6
    conversion
    puts "Created '#{@output_file}' containing #{file_characters} characters"
    show_change_in_output_file
  end

  def convert
    braille_to_english_letter = {
      ["0.", "..", ".."]=>"a",
      ["0.", "0.", ".."]=>"b",
      ["00", "..", ".."]=>"c",
      ["00", ".0", ".."]=>"d",
      ["0.", ".0", ".."]=>"e",
      ["00", "0.", ".."]=>"f",
      ["00", "00", ".."]=>"g",
      "0.00.."          =>"h",
      [".0", "0.", ".."]=>"i",
      [".0", "00", ".."]=>"j",
      ["0.", "..", "0."]=>"k",
      ["0.", "0.", "0."]=>"l",
      ["00", "..", "0."]=>"m",
      ["00", ".0", "0."]=>"n",
      ["0.", ".0", "0."]=>"o",
      ["00", "0.", "0."]=>"p",
      ["00", "00", "0."]=>"q",
      ["0.", "00", "0."]=>"r",
      [".0", "0.", "0."]=>"s",
      [".0", "00", "0."]=>"t",
      ["0.", "..", "00"]=>"u",
      ["0.", "0.", "00"]=>"v",
      [".0", "00", ".0"]=>"w",
      ["00", "..", "00"]=>"x",
      ["00", ".0", "00"]=>"y",
      ["0.", ".0", "00"]=>"z",
      ["..", "..", ".."]=>" ",
      ["..", "00", ".0"]=>"."
    }
  end

  def read_file
    read = File.read("#{@input_file}").chomp
    no_line = read.delete("\n")
    # if read.length > 80
    #   array = read.chars.each_slice(80).map(&:join)
    #   x = array.map do |letter|
    #     letter.chars
    #   end
    # else
    [no_line]
      # [no_line.chars]
    # end
    # require "pry"; binding.pry
  end

  def conversion
      letters = read_file.map do |braille|
        convert[braille]
      end
      # braille = read_file.map do |sliced_array|
      #   sliced_array.map do |letter|
      #     convert[letter]
      #   end
      # end
      message = ""

      letters.each do |letter|
        message += "#{letter}"
      end
      #
      # braille.each do |sliced_array|
      #   top = ""
      #   middle = ""
      #   bottom = ""
      #   sliced_array.each do |braille_array|
      #     top << braille_array[0]
      #     middle << braille_array[1]
      #     bottom << braille_array[2]
      #   end
      #   message += "#{top}\n#{middle}\n#{bottom}\n\n"
      # end
      message
      # require "pry"; binding.pry
    end

    def show_change_in_output_file
      File.open("#{@output_file}", "w") {|fo| fo.write("#{conversion}") }
    end
    require "pry"; binding.pry
  end
