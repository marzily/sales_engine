require_relative 'test_helper'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    data  = Parser.new("./test/fixtures/merchants.csv").values
    @repo = MerchantRepository.new(data, nil)
  end

  def test_it_can_find_merchants_by_name
    invoice_object = repo.find_by_name("Hand-Spencer")

    assert_equal 9, invoice_object.id
  end

  def test_it_can_find_all_merchants_by_name
    assert_equal 1, repo.find_all_by_name("Schroeder-Jerde").count
  end
end
