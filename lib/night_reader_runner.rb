require "./lib/night_reader"

@input = ARGV[0]
@input_2 = ARGV[1]
reader = NightReader.new(@input, @input_2)
reader.start
