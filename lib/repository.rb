require_relative 'parser'
require_relative 'customer'


class Repository
  include Parser

  attr_reader :data, :collection, :engine

  def initialize(file_path, engine)
    @data       = parse(file_path)
    @collection = generate
    @engine     = engine
  end

  def generate
    class_repos = { CustomerRepository => Customer,
                    # MerchantRepository: Merchant,
                    # InvoiceRepository: Invoice,
                    # InvoiceItemRepository: Invoice_Item,
                    # ItemRepository: Item,
                    # TransactionRepository: Transaction }
                  }

    data.map do |object_data|
      class_repos[self.class].new(object_data, self)
    end
  end

  def all
    collection
  end

  def random
    collection.sample
  end

  def find_by_id(id)
    collection.find { |object| object.id == id }
  end

  def find_by_created_at(time_stamp)
    collection.find { |object| object.created_at == time_stamp }
  end

  def find_by_updated_at(time_stamp)
    collection.find { |object| object.updated_at == time_stamp }
  end
end

# r = Repository.new('./test/fixtures/customers.csv', nil)
# p r.collection
