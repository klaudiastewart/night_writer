require "./lib/night_writer"

@input = ARGV[0]
@input_2 = ARGV[1]
writer = NightWriter.new(@input, @input_2)
writer.start
