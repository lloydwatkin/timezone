require 'timezone/lookup/test'
require 'timezone'
require 'minitest/autorun'

class TestTest < ::Minitest::Test
  parallelize_me!

  def lookup
    Timezone::Lookup::Test.new(OpenStruct.new)
  end

  def test_simple_stub
    mine = lookup
    mine.stub(-10, 10, 'America/Los_Angeles')

    assert_equal 'America/Los_Angeles', mine.lookup(-10, 10)
  end

  def test_missing_stub
    assert_raises(::Timezone::Error::Test) do
      lookup.lookup(100, 100)
    end
  end
end
