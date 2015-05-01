require './test/test_helper'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new('./test/fixtures/')
    engine.startup
  end

  def test_it_loads_hash_data_if_data_is_nil
    assert_instance_of CSV, engine.data[:customers]
    assert_equal 6, engine.data.count
  end

  def test_creates_customer_repository
    assert_instance_of CustomerRepository, engine.customer_repository
  end

  def test_it_loads_customer_repo_dependencies
    assert_equal 10, @engine.customer_repository.all.count
  end

  def test_customer_repository_loads_the_correct_csv_file
    assert_equal "Joey", @engine.customer_repository.find_by_id(1).first_name
  end

  def test_creates_invoice_repository
    assert_instance_of InvoiceRepository, engine.invoice_repository
  end

  def test_it_loads_invoice_repo_dependencies
    assert_equal 10, @engine.invoice_repository.all.count
  end

  def test_invoice_repository_loads_the_correct_csv_file
    assert_equal 26, @engine.invoice_repository.find_by_id(1).merchant_id
  end

  def test_creates_invoice_item_repository
    assert_instance_of InvoiceItemRepository, engine.invoice_item_repository
  end

  def test_it_loads_invoice_item_repo_dependencies
    assert_equal 10, @engine.invoice_item_repository.all.count
  end

  def test_invoice_item_repository_loads_the_correct_csv_file
    assert_equal 539, @engine.invoice_item_repository.find_by_id(1).item_id
  end

  def test_creates_item_repository
    assert_instance_of ItemRepository, engine.item_repository
  end

  def test_it_loads_item_repo_dependencies
    assert_equal 10, @engine.item_repository.all.count
  end

  def test_item_repository_loads_the_correct_csv_file
    assert_equal "Item Provident At", @engine.item_repository.find_by_id(6).name
  end

  def test_creates_merchant_repository
    assert_instance_of MerchantRepository, engine.merchant_repository
  end

  def test_it_loads_merchant_repo_dependencies
    assert_equal 10, @engine.merchant_repository.all.count
  end

  def test_merchant_repository_loads_the_correct_csv_file
    assert_equal "Osinski, Pollich and Koelpin", @engine.merchant_repository.find_by_id(8).name
  end

  def test_creates_transaction_repository
    assert_instance_of TransactionRepository, engine.transaction_repository
  end

  def test_it_loads_transaction_repo_dependencies
    assert_equal 10, @engine.transaction_repository.all.count
  end

  def test_transaction_repository_loads_the_correct_csv_file
    assert_equal 4354495077693036, @engine.transaction_repository.find_by_id(3).credit_card_number
  end

end
