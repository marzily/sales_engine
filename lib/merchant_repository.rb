require './lib/parser'
require './lib/merchant'

class MerchantRepository
  attr_reader :merchants, :engine

  include Parser

  def initialize(data, engine)
    @engine    = engine
    @merchants = data.map { |line| Merchant.new(line, self) }
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end
end