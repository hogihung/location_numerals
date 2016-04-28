class LocationNumeral
  VALID_LTRS = ('a'..'z').to_a

  def initialize
    @decoder = Hash.new
    VALID_LTRS.each { |ltr| @decoder[ltr] = (2 ** VALID_LTRS.index(ltr)) }
  end

  def ltr_to_int(ltr)
    return "Invalid argument: [#{ltr}] is not a valid letter" unless VALID_LTRS.include?(ltr)
    2 ** VALID_LTRS.index(ltr)
  end

  def int_to_lf_numeral(number)
    return "Invalid argument: [#{number}] is not a positive integer" unless valid_positive_integer?(number)

    current_value = 0
    long_numeral = []

    sample_set = @decoder.select { |k,v| v < number }

    while current_value < number
      sample_set.each do |key, value|
        current_value += value if (value < number)
        long_numeral << key if (current_value <= number)
      end
      long_numeral
    end

    ln = long_numeral.join
    unless numeral_to_integer(ln) == number
      sample_set.each do |key, value|
        long_numeral << key if (numeral_to_integer(ln) + value == number)
      end
    end
    long_numeral.sort!
    long_numeral.join
  end

  def numeral_to_integer(numeral)
    return "Invalid argument: [#{numeral}] is not a valid letter" unless numeral.is_a? String
    int     = 0
    letters = numeral.chars

    letters.each do |ltr|
      int += ltr_to_int(ltr)
    end
    int
  end

  def lf_numeral_to_abbr(lf_numeral)
    number = numeral_to_integer(lf_numeral)
    sample_set = @decoder.select { |k,v| v < number }

    reversed_sample_set = Hash[sample_set.to_a.reverse]

    fn, current_value = reversed_sample_set.shift
    first_numeral = fn.dup
    abbrv_numeral = ""

    reversed_sample_set.each do |key, value|
      abbrv_numeral << key unless ((current_value + value) > number)
      next if current_value >= number
    end
    abbrv_numeral << first_numeral
    abbrv_numeral
  end

  private

  def valid_positive_integer?(number)
    return false unless (number.is_a?(Integer) && number >= 1)
    true
  end

end

