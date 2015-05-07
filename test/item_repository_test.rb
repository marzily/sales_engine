require_relative 'test_helper'
require 'bigdecimal'

class ItemRepositoryTest < Minitest::Test
  attr_reader :repo, :repo_from_engine

  def setup
    item_data = Parser.new("./test/fixtures/items.csv").values
    @repo = ItemRepository.new(item_data, nil)

    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @repo_from_engine = engine.item_repository
  end

  def test_it_finds_first_item_by_name
    assert_equal 2, repo.find_by_name("Item Autem Minima").id
  end

  def test_it_finds_all_items_by_name
    assert_equal 1, repo.find_all_by_name("Item Autem Minima").count
  end

  def test_it_finds_first_item_by_description
    description = "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem."
    assert_equal 4, repo.find_by_description(description).id
  end

  def test_it_finds_all_items_by_description
    description = "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem."
    assert_equal 1, repo.find_all_by_description(description).count
  end

  def test_it_finds_first_item_by_unit_price
    assert_equal 8, repo.find_by_unit_price(BigDecimal.new(34355) / 100).id
  end

  def test_it_finds_all_items_by_unit_price
    assert_equal 1, repo.find_all_by_unit_price(BigDecimal.new(34355) / 100).count
  end

  def test_it_finds_first_item_by_merchant_id
    assert_equal 1, repo.find_by_merchant_id(1).id
  end

  def test_it_finds_all_items_by_merchant_id
    assert_equal 10, repo.find_all_by_merchant_id(1).count
  end

  def test_it_returns_items_ranked_by_revenue_generated
    assert_equal [4, 1], repo_from_engine.most_revenue(2).map(&:id)
  end

  def test_it_returns_items_ranked_by_total_sold
    assert_equal [4, 1], repo_from_engine.most_items(2).map(&:id)
  end

end
