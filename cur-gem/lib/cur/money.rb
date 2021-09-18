module Cur
  class Money
    
    attr_reader :amount, :currency

    def self.conversion_rates(base_currency, currency_map={})
      @@currency_map = currency_map
      @@base_currency = base_currency
    end

    def initialize(amount, currency)
      raise CoversionRatesEmptyError.new unless self.class.currency_map

      @amount = amount    
      @currency = currency
      @base_currency_amount = @@base_currency == currency ? amount : (amount / self.class.currency_map[currency])
    end

    def convert_to(currency)
      self.class.new(conversation_rate(currency) * @base_currency_amount, currency)
    end

    def +(money)
      self.class.new(amount + conversion_amount(money), @currency)
    end

    def -(money)
      self.class.new(amount - conversion_amount(money), @currency)
    end

    def /(num)
      self.class.new(amount / num, @currency)
    end

    def *(num)
      self.class.new(amount * num, @currency)
    end

    def ==(money)
      @amount == conversion_amount(money)
    end

    def >(money)
      @amount > conversion_amount(money)
    end

    def <(money)
      @amount < conversion_amount(money)
    end

    def inspect
      "#{'%0.2f' % @amount} #{@currency}"
    end

    def self.currency_map
      class_variable_defined?('@@currency_map') ? @@currency_map : nil
    end

    private

    def conversation_rate(currency)
      @@currency_map[currency] || 1
    end

    def conversion_amount(money)
      (money.currency == @currency) ? money.amount : money.convert_to(@currency).amount
    end

  end
end
