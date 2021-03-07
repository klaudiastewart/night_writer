require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_it_exists
    writer = NightWriter.new("iliketurtles", "braille.txt")
    assert_instance_of NightWriter, writer
  end

  # def test_a_single_letter_can_convert
  #   writer = NightWriter.new("message.txt", "iliketurtles")
  #   assert_equal expected, @writer.show_change_in_output_file
  # end
end
