require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'
require './lib/parser'
require './lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test
  include Parser

  attr_reader :fixtures

  def setup
    @fixtures = parse('./test/fixtures/invoices.csv')
  end

  def test_merchant_repository_exists
    assert MerchantRepository.new(fixtures, nil)
  end

  def test_it_knows_sales_engine
    engine = SalesEngine.new("stub")
    merchant_repo = MerchantRepository.new(fixtures, engine)

    assert_equal engine, merchant_repo.engine
  end

  def test_it_returns_all_merchants
    merchant_repo = MerchantRepository.new(fixtures, nil)

    assert_equal 10, merchant_repo.all.count
  end

  def test_it_returns_random_merchants
    merchant_repo = MerchantRepository.new(fixtures, nil)

    assert merchant_repo.random
  end

  def test_it_can_find_merchants_by_name
    merchant_repo = MerchantRepository.new(fixtures, nil)
    result        = merchant_repo.find_by_name('Hand-Spencer')

    assert_equal 9, result.id
  end
end




