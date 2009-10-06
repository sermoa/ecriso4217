module Siff
  class Currency
    attr_reader :code, :sign

    def initialize(code, sign)
      @code, @sign = code, utf8(sign)
    end

    private
    def utf8(string)
      string.gsub(/U\+([0-9a-fA-F]{4,4})/u){["#$1".hex ].pack('U*')}
    end
  end


  EURO = Currency.new(:EUR, "U+20ac")
  GBP = Currency.new(:GBP, "U+00a3")
  USD = Currency.new(:USD, "U+0024")
  GENERIC_SYMBOL = "U+00a4"

  SIFFS = {
    :BE => EURO, 
    :BG => EURO,
    :CA => Currency.new(:CAD, "CanU+0024"),
    :CZ => EURO,
    :DK => EURO,
    :DE => EURO,
    :EE => EURO,
    :IE => EURO,
    :EL => EURO,
    :ES => EURO,
    :FR => EURO,
    :GB => GBP, 
    :IT => EURO,
    :CY => EURO,
    :LV => EURO,
    :LT => EURO,
    :LU => EURO,
    :HU => EURO,
    :MT => EURO,
    :NL => EURO,
    :AT => EURO,
    :PL => EURO,
    :PT => EURO,
    :RO => EURO,
    :SI => EURO,
    :SK => EURO,
    :FI => EURO,
    :SE => EURO,
    :UK => GBP,
    :US => USD
  }

  def currency_for(country_code, default_when_currency_not_found= 'unknown')
    SIFFS[country_code] || Currency.new(default_when_currency_not_found,GENERIC_SYMBOL) 
  end

  def currency_code_for(country_code, default_when_currency_not_found= 'unknown')
    currency_for(country_code, default_when_currency_not_found).code.to_s
  end

  def currency_sign_for(country_code, default_when_currency_not_found= 'unknown')
    currency_for(country_code, default_when_currency_not_found).sign
  end

end
