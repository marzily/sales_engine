require './test/test_helper'
require 'csv'

class ItemRepositoryTest < Minitest::Test
  include Parser

  attr_reader :repo

  def setup
    item_data = parse("./test/fixtures/items.csv")
    @repo = ItemRepository.new(item_data, nil)
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
    assert_equal 8, repo.find_by_unit_price(34355).id
  end

  def test_it_finds_all_items_by_unit_price
    assert_equal 1, repo.find_all_by_unit_price(34355).count
  end

  def test_it_finds_first_item_by_merchant_id
    assert_equal 1, repo.find_by_merchant_id(1).id
  end

  def test_it_finds_all_items_by_merchant_id
    assert_equal 10, repo.find_all_by_merchant_id(1).count
  end

end
