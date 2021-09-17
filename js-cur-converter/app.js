//  Vue App: CurrencyConverter
const CurrencyConverterApp = {

  data() {

    return {

      form: {
        fromCurrency: 'EUR',
        Amount: 1,
        toCurrency: 'USD'
      },

      selectedBaseCurrency: null,
      currencyConversionRates: []
    }

  },

  created:function(){
    Money.conversion_rates("EUR", { ["USD"]: 1.11, ["Bitcoin"]: 0.0047 })
  },

  computed: {
    convertedAmount() {
      return (new Money(this.form.Amount, this.form.fromCurrency)).convert_to(this.form.toCurrency).amount.toFixed(4);
    }
  },

  methods: {

    populateConversionRates() {
      this.currencyConversionRates = []
      if(this.selectedBaseCurrency == null) {
        return
      }

      let currencies = this.currencyNames()      
      let rateRatio = Money.base_currency == this.selectedBaseCurrency ? 1 : (1 / Money.currency_map[this.selectedBaseCurrency])
      for( i = 0; i < currencies.length; i++ ) {
        rate = Money.base_currency == currencies[i] ? 1 : Money.currency_map[currencies[i]]
        this.currencyConversionRates.push({ "currency": currencies[i], "rate": (rate * rateRatio).toFixed(4) })
      }
    },

    currencyNames() {
      return Object.keys(Money.currency_map).concat([Money.base_currency]);
    }

  }

}

// Class Money
class Money {
  static currency_map = null
  static base_currency = null
  
  static conversion_rates(base_currency, currency_map={}) {
     this.currency_map = currency_map;
     this.base_currency = base_currency
  };  
  
  constructor(amount, currency) {
    this.amount = amount;
    this.currency = currency;
  };
  
  baseCurrencyAmount() {
    return Money.base_currency == this.currency ? this.amount : (() => {
       return this.amount / Money.currency_map[this.currency]
    })()
  }
  
  convert_to(currency) {
    return (new Money(this.conversation_rate(currency) * this.baseCurrencyAmount(), currency))
  }
  
  conversation_rate(currency) {
    return (Money.currency_map[currency] || 1)
  }  
}

Vue.createApp(CurrencyConverterApp).mount('#curConverter')
