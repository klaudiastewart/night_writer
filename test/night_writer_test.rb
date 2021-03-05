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

end
