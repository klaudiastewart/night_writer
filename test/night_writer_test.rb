require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_it_exists
    writer = NightWriter.new("message.txt", "output_example.txt")
    assert_instance_of NightWriter, writer
  end

  def test_a_single_letter_length_and_conversion
    writer = NightWriter.new("message_test.txt", "output_example.txt")
    expected = "0.\n00\n..\n"
    assert_equal 9, writer.conversion.length
    assert_equal expected, writer.conversion
  end

  def test_two_letters_length_and_conversion_and_down_case
    writer = NightWriter.new("message_test_2.txt", "output_example.txt")
    expected = "0.0.\n00..\n....\n"
    assert_equal 15, writer.conversion.length
    assert_equal expected, writer.conversion
  end

  def test_over_forty_letters_length_and_conversion
    writer = NightWriter.new("message_test_3.txt", "output_example.txt")
    expected = ".00.0..0.00..0...0.0000..0...0.00..00.0..0.00..0...00.0..00.0....0.0...00.0..00.\n00.0000.000000..000..00000..000.0000..000000..0...00..0000.0....000...00..000..0\n0...0.......0.....0.....0.....0.0...0...0...0.0.....0...0.........0.....0.0.0...\n0..0....\n0.00..00\n..0....0\n"
    assert_equal expected, writer.conversion
    assert_equal 270, writer.conversion.length
  end

  def test_it_has_conversion_chart
    writer = NightWriter.new("message_test.txt", "output_example.txt")
    assert writer.convert
  end

  def test_read_file_for_one_letter
    writer = NightWriter.new("message_test.txt", "output_example.txt")
    assert_equal ([["h"]]), writer.read_file
  end

  def test_read_file_for_two_letters
    writer = NightWriter.new("message_test_2.txt", "output_example.txt")
    assert_equal ([["h", "a"]]), writer.read_file
  end

  def test_read_file_for_over_forty_letters
    writer = NightWriter.new("message_test_3.txt", "output_example.txt")
    assert_equal ([["t", "e", "r", "i", "j", "h", "t", " ", "j", "s", "d", "h", "t", " ", "j", "s", "r", "j", "k", "h", "t", "j", "k", "s", " ", "j", "k", "h", "t", "e", "a", " ", "j", "s", " ", "j", "k", "r", "s", "e"], ["b", "t", " ", "."]]), writer.read_file
  end

  def test_it_has_start_method
    writer = NightWriter.new("message_test_3.txt", "output_example.txt")
    assert writer.start
  end
end
