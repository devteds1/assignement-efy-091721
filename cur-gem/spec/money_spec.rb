RSpec.describe Cur::Money do

  context "with conversation rates configured" do

    before :all do
      Cur::Money.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })
    end


    describe "money and conversions" do
      let(:fifty_euro) { Cur::Money.new(50, 'EUR') }    
  
      it "returns valid amount and currency code" do      
        expect(fifty_euro.amount).to eq(50)
        expect(fifty_euro.currency).to eq('EUR')
        expect(fifty_euro.inspect).to eq('50.00 EUR')
      end
  
      it "converts EUR to USD" do 
        expect(fifty_euro.convert_to('USD').inspect).to eq('55.50 USD')
        fifty_five_usd = Cur::Money.new(55.50, 'USD')
        expect(fifty_five_usd.convert_to('EUR').inspect).to eq('50.00 EUR')
        
      end
    end
  

    describe "arithmetic" do
      let(:fifty_euro) { Cur::Money.new(50, 'EUR') }
      let(:twenty_usd) { Cur::Money.new(20, 'USD') }
  
      it "returns an EUR for the sum of EUR and USD objects" do
        expect((fifty_euro + twenty_usd).inspect).to eq('68.02 EUR')
      end
  
      it "returns an EUR for the difference of EUR and USD objects" do
        expect((fifty_euro - twenty_usd).inspect).to eq('31.98 EUR')
      end
  
      it "returns an EUR object when EUR is divided by a number" do
        expect((fifty_euro / 2).inspect).to eq('25.00 EUR')
      end
  
      it "returns an EUR object when EUR is multiplied by a number" do
        expect((fifty_euro * 3).inspect).to eq('150.00 EUR')
      end
    end

    
    describe "comparison" do
      let(:fifty_euro) { Cur::Money.new(50, 'EUR') }
      let(:twenty_usd) { Cur::Money.new(20, 'USD') }
      let(:twenty_euro) { Cur::Money.new(20, 'EUR') }
      let(:twenty_usd_in_eur) { twenty_usd.convert_to('EUR') }
  
      it "compares two Money value of same or different currencies to check equal" do
        expect(twenty_usd).to eq(twenty_usd)
        expect(twenty_usd_in_eur).to eq(twenty_usd)
        expect(twenty_euro).to_not eq(twenty_usd)
      end
  
      it "compares two Money value of same or different currencies to check one is greater" do
        expect(twenty_usd_in_eur > twenty_usd).to be false
        expect(twenty_euro > twenty_usd).to be true
        expect(twenty_euro < fifty_euro).to be true
      end    
    end    
  end

  context "without the conversation rates configured" do

    before :each do 
      allow(Cur::Money).to receive(:currency_map) { nil } # or Cur::Money.conversion_rates(nil, nil)
    end

    it "raises an error on creating Money instance" do      
      expect { Cur::Money.new(100, 'USD') }.to raise_error(Cur::CoversionRatesEmptyError)
    end
    
  end

end
