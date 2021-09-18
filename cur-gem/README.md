# Cur Gem

## Dev Environment: Docker

Create container image to be used as container shell with ruby &  gems installed. See the `Dockerfile`

**Note:** Non-docker environment can be used as well. Gem has been developed & tested using ruby 3.0.1 on docker.

```
docker build -t cur-gem .
```

SSH to docker container shell,

```
docker run -it --rm -v $PWD:/gem:rw cur-gem:latest

# Dev, test or build the gem
> rake spec
> rake build

# Or run bin/console to experiment during development
> bin/console
```


## Usage

TODO: Release

Add `cur` gem to your Gemfile

```
gem 'cur'
```

Bundle install and use,

```
require 'cur'

# Load conversion rates
Cur::Money.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
})

fifty_euro = Cur::Money.new(50, 'EUR')
fifty_euro.amount       # Returns  50
fifty_euro.currency     # Returns 'EUR'
fifty_euro.inspect      # Returns "50.00 EUR"

# Conversion
fifty_euro_in_usd = fifty_euro.convert_to('USD') # Returns Money object with currency converted to USD 
fifty_euro_in_usd.inspect # # Returns '55.50 USD'

# Arithmetic
fifty_euro = Cur::Money.new(50, 'EUR')
twenty_usd = Cur::Money.new(20, 'USD')

fifty_euro + twenty_usd # 68.02 EUR
fifty_euro - twenty_usd # 31.98 EUR
fifty_euro / 2          # 25.00 EUR
fifty_euro * 3          # 150.00 EUR

# Comparison
fifty_euro  = Cur::Money.new(50, 'EUR')
twenty_usd  = Cur::Money.new(20, 'USD')
twenty_euro = Cur::Money.new(20, 'EUR')
twenty_usd_in_eur = twenty_usd.convert_to('EUR')

twenty_usd == twenty_usd  # true
twenty_usd_in_eur == twenty_usd # true
twenty_euro == twenty_usd # false

twenty_usd_in_eur > twenty_usd # false
twenty_euro > twenty_usd # true
twenty_euro < fifty_euro # true
```
