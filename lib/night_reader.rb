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
      "0....."=>"a",
      "0.0..."=>"b",
      "00...."=>"c",
      "00.0.."=>"d",
      "0..0.."=>"e",
      "000..."=>"f",
      "0000.."=>"g",
      "0.00.."=>"h",
      ".00..."=>"i",
      ".000.."=>"j",
      "0...0."=>"k",
      "0.0.0."=>"l",
      "00..0."=>"m",
      "00.00."=>"n",
      "0..00."=>"o",
      "000.0."=>"p",
      "00000."=>"q",
      "0.000."=>"r",
      ".00.0."=>"s",
      ".0000."=>"t",
      "0...00"=>"u",
      "0.0.00"=>"v",
      ".000.0"=>"w",
      "00..00"=>"x",
      "00.000"=>"y",
      "0..000"=>"z",
      "......"=>" ",
      "..00.0"=>"."
    }
  end

  def read_file
    read = File.read("#{@input_file}").chomp
    rows = ["", "", ""]
    counter = 0
    product = read.split
    while counter < read.split.size do
      rows[0] << product[counter]
      rows[1] << product[counter + 1]
      rows[2] << product[counter + 2]
      counter += 3
    end
    stringed_output = rows.map do |element|
      element.scan(/../)
    end
    stringed_output
  end

  def conversion
    stringed_message = ""
    counter = 0
    until counter == read_file[0].size do
      read_file.each do |braille|
        stringed_message << braille[counter]
      end
      counter += 1
    end
    output_message = stringed_message.scan(/....../).map do |string|
      convert[string]
    end.join
    output_message
  end

  def show_change_in_output_file
    File.open("#{@output_file}", "w") {|fo| fo.write("#{conversion}") }
  end
end
