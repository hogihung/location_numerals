require 'minitest/autorun'
require './loc_num'

class LocationNumeralTest < Minitest::Test

  def setup
    @loc_num = LocationNumeral.new
  end

  def test_return_error_for_not_valid_ltr
    assert_equal 'Invalid argument: [54] is not a valid letter', @loc_num.ltr_to_int(54)
  end

  def test_return_error_for_not_valid_integer
    assert_equal 'Invalid argument: [-12] is not a positive integer', @loc_num.int_to_lf_numeral(-12)
    assert_equal 'Invalid argument: [3.14] is not a positive integer', @loc_num.int_to_lf_numeral(3.14)
  end

  def test_convert_ltr_to_int
    assert_equal 1, @loc_num.ltr_to_int('a')
    assert_equal 2, @loc_num.ltr_to_int('b')
    assert_equal 4, @loc_num.ltr_to_int('c')
    assert_equal 8, @loc_num.ltr_to_int('d')
    assert_equal 16, @loc_num.ltr_to_int('e')
    assert_equal 8388608, @loc_num.ltr_to_int('x')
    assert_equal 33554432, @loc_num.ltr_to_int('z')
  end

  def test_integer_returns_abbr_form_location_numeral
    abbrv_form = @loc_num.int_to_lf_numeral(9)
    assert_equal 'ad', @loc_num.lf_numeral_to_abbr(abbrv_form)
  end

  def test_integer_returns_long_form_location_numeral
    assert_equal 'abbc', @loc_num.int_to_lf_numeral(9)
  end

  def test_location_numeral_returns_an_integer
    assert_equal 9, @loc_num.numeral_to_integer('ad')
    assert_equal 9, @loc_num.numeral_to_integer('abbc')
    assert_equal 3147, @loc_num.numeral_to_integer('abdgkl')

    assert_equal 1, @loc_num.numeral_to_integer('a')
    assert_equal 8388608, @loc_num.numeral_to_integer('x')
  end


  def test_converts_long_form_numeral_to_abbreviated_form
    assert_equal 'ad', @loc_num.lf_numeral_to_abbr('abbc')
  end

end
