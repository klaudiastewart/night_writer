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
      "0.00.."=>"h",
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
    # read == message on night_writer

    # if read.length > 80
    #   array = read.chars.each_slice(80).map(&:join)
    #   x = array.map do |letter|
    #     letter.chars
    #   end
    array = no_line.chars
    count = array.count / 3
    product = array.each_slice(count).to_a #makes an array of three arrays each representing top, middle, bottom

  end

  def conversion
      top = ""
      middle = ""
      bottom = ""

      letters = read_file.each do |braille|
        top << braille[0..1].join
        middle << braille[2..3].join
        bottom << braille[4..5].join
      end
      letters = convert[top] + convert[middle] + convert[bottom]
      letters
    end

    def show_change_in_output_file
      File.open("#{@output_file}", "w") {|fo| fo.write("#{conversion}") }
    end
  end
