# Location Numeral

## Code challenge
Create a class in Ruby to convert from decimal numbers to location numerals and back. This class should have 3 public facing methods:

* One method that takes an integer and returns the location numeral in abbreviated form. That is, you pass in 9 and it returns “ad"

* One method that takes a location numeral and returns its value as an integer. That is, you pass “ad” in, and it returns 9

* One method that takes a location numeral and returns it in abbreviated form. That is, you pass in “abbc” and it returns “ad"

This method should handle numbers up to 2^26 (67108864).

Learning more about location numerals: https://en.wikipedia.org/wiki/Location_arithmetic#Location_numerals

## Testing
The solution presented here was accomplished using TDD (test driven design.)  The testing tool used is Minitest.  Confirm that Minitest is installed by running:

```
➜  ~ gem list | grep 'minitest'
minitest (5.8.4, 5.8.3)
minitest-reporters (1.1.8)
minitest-spec-rails (5.3.0)
➜  ~
```

To run the test suite, use the following:

```
ruby test/loc_num_test.rb
```

