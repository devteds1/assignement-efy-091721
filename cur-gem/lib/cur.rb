require_relative "cur/version"
require_relative "cur/money"

module Cur
  class Error < StandardError; end

  class CoversionRatesEmptyError < StandardError; end
end

