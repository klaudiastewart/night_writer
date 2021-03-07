require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_it_exists
    writer = NightWriter.new("iliketurtles", "braille.txt")
    assert_instance_of NightWriter, writer
  end

  def test_a_single_letter_can_convert
    writer = NightWriter.new("message.txt", "h")
    expected = "0.\n00\n.."
    require "pry"; binding.pry
    assert_equal expected, writer.conversion
  end

  def test_two_letters_can_convert
    writer = NightWriter.new("message.txt", "ho")
    expected = "0.0.\n00.0\n..0."
    assert_equal expected, writer.conversion #why does this just return the last line?
  end

  def test_read_file_for_less_than_40_characters
    writer = NightWriter.new("message_test.txt", "howdy yall.")
    expected = [["h", "o", "w", "d", "y", " ", "y", "a", "l", "l", "."]]
    assert_equal expected, writer.read_file
  end

  def test_it_has_conversion_chart
    writer = NightWriter.new("message_test.txt", "howdy yall.")
    expected = english_letter_to_braille_symbol = {
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
    assert expected, writer.convert
  end

  def test_read_file_for_more_than_40_characters
    writer = NightWriter.new("message_test.txt", "howdy yall. i like beans and this is going to be longet than forty characters.")
    expected = [["h", "o", "w", "d", "y", " ", "y", "a", "l", "l", ".", " ", "i", " ", "l", "i", "k", "e", " ", "b", "e", "a", "n", "s", " ", "a", "n", "d", " ", "t", "h", "i", "s", " ", "i", "s", " ", "g", "o", "i"],
    ["n", "g", " ", "t", "o", " ", "b", "e", " ", "l", "o", "n", "g", "e", "t", " ", "t", "h", "a", "n", " ", "f", "o", "r", "t", "y", " ", "c", "h", "a", "r", "a", "c", "t", "e", "r", "s", "."]]
    assert_equal expected, writer.read_file
  end
end
