require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
  def test_it_exists
    reader = NightReader.new("braille_test.txt", "output_example.txt")
    assert_instance_of NightReader, reader
  end

  def test_one_braille_character_conversion_and_length
    reader = NightReader.new("braille_test.txt", "output_example.txt")
    assert_equal "a", reader.conversion
    assert_equal 1, reader.conversion.length
  end

  def test_two_braille_characters_conversion_and_length
    reader = NightReader.new("braille_test_2.txt", "output_example.txt")
    assert_equal "ab", reader.conversion
    assert_equal 2, reader.conversion.length
  end

  def test_over_forty_braille_characters_conversion_and_length
    reader = NightReader.new("braille_test_3.txt", "output_example.txt")
    assert_equal "terijht jsdht jsrjkhtjks jkhtea js jkrsebt .", reader.conversion
    assert_equal 44, reader.conversion.length
  end

  def test_it_has_a_conversion_chart
    reader = NightReader.new("braille_test_3.txt", "output_example.txt")
    assert reader.convert
  end

  def test_read_file_for_one_braille_character
    reader = NightReader.new("braille_test.txt", "output_example.txt")
    expected = [["0."], [".."], [".."]]
    assert_equal expected, reader.read_file
  end

  def test_read_file_for_two_braille_characters
    reader = NightReader.new("braille_test_2.txt", "output_example.txt")
    expected = [["0.", "0."], ["..", "0."], ["..", ".."]]
    assert_equal expected, reader.read_file
  end

  def test_it_has_start_method
    reader = NightReader.new("braille_test.txt", "output_example.txt")
    assert reader.start
  end
end
