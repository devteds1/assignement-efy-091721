# Altmetric Refactoring Exercise

Inside this directory you'll find a Ruby program to format date ranges with
optional start and end times.

You can run its test suite like so:

    $ bundle install
    $ rspec

The main code can be found in lib/date_range_formatter.rb and its behaviour is
defined in spec/date_range_formatter_spec.rb

However, the code is difficult to read and seems to have a bug: when given a
start date of 2009-11-1 and an end date of 2010-11-3, it should format the
date range as "1st November 2009 - 3rd November 2010" but actually returns
"1st - 3rd November 2009".

Find and fix the bug, writing tests if need be and refactor the code as you
see fit.

## Note: Refactored

- Code changes
  - Created mutliple smaller methods instead of one method that had poor readability
  - Used `switch` block instead of multiple `if-else` statements. I feel it makes the code better readable and maintenable
  - Added attribute reader methods for all the instance variables to avoid using `@` in many places. I find this much cleaner
- Test case changes
  - Grouped test cases into different contexts for better readability. `rspec -f d`
  - Added one test case to address the bug fix
- Another approach for code coverage: (suggestion)
  - Write test cases for individual smaller functions such as `format_for_same_day`, `format_for_different_dates`, `full_date`, `same_day?` etc.
  - Stub the response of already tested methods while testing `to_s`. For example, stub the response of `same_day?` to return true and expect the `format_for_same_day` be invoked