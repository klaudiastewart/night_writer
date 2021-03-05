require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @writer = NightWriter.new("braille.txt")
  end

  def test_it_exists
    assert_instance_of NightWriter, @writer
  end

  # def test_a_single_letter_can_convert
  #   assert_equal "0.....", @writer.covert("a")
  # end
end
