require './test/test_helper'
require 'csv'

class InvoiceItemRepositoryTest < Minitest::Test

  def setup
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @repo = engine.invoice_item_repository
  end

  def test_it_returns_all_invoice_items
    assert_equal 10, @repo.all.count
    assert_equal 539, @repo.all.first.item_id
    assert_equal 1830, @repo.all.last.item_id
  end

  def test_it_returns_a_random_invoice_item
    sample = 10.times.map { |i| @repo.random.item_id }
    refute sample.all? { |name| name == sample.first }
  end

  def test_it_finds_a_invoice_item_by_id
    assert_equal 529, @repo.find_by_id(5).item_id
  end

end
