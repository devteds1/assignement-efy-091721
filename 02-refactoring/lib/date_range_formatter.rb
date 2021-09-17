require "date"
require "fixnum"

class DateRangeFormatter

  attr_reader :start_date, :start_time, :end_date, :end_time

  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date   = Date.parse(end_date)
    @start_time = start_time
    @end_time   = end_time
  end

  def to_s
    same_day? ? format_for_same_day : format_for_different_dates
  end

  private

  def format_for_same_day
    case
    when start_time && end_time then  "#{full_start_date_with_time} to #{end_time}"
    when start_time             then  "#{full_start_date_with_time}"
    when end_time               then  "#{full_start_date} until #{end_time}"
    else                              full_start_date
    end
  end

  def format_for_different_dates
    case
    when start_time && end_time then  "#{full_start_date_with_time} - #{full_end_date_with_time}"
    when start_time             then  "#{full_start_date_with_time} - #{full_end_date}"
    when end_time               then  "#{full_start_date} - #{full_end_date_with_time}"
    when same_month?            then  "#{start_date.day.ordinalize} - #{full_end_date}"
    when same_year?             then  "#{short_date(start_date)} - #{full_end_date}"
    else                              "#{full_start_date} - #{full_end_date}"
    end
  end

  def same_year?
    start_date.year == end_date.year
  end

  def same_month?
    same_year? && start_date.month == end_date.month
  end

  def same_day?
    start_date == end_date
  end

  def full_start_date
    @full_start_date ||= full_date(start_date)
  end

  def full_end_date
    @full_end_date ||= full_date(end_date)
  end

  def full_start_date_with_time
    "#{full_start_date} at #{start_time}"
  end

  def full_end_date_with_time
    "#{full_end_date} at #{end_time}"
  end

  def full_date(date)
    date.strftime("#{date.day.ordinalize} %B %Y") # eg: 4th November 2010
  end

  def short_date(date)
    date.strftime("#{date.day.ordinalize} %B")    # eg: 3rd November
  end

end

