require './lib/parser'
require './lib/invoice'

class InvoiceRepository
  attr_reader :invoices, :engine

  include Parser

  def initialize(data, engine)
    @engine   = engine
    @invoices = data.map {|line| Invoice.new(line, self)} 
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.find { |invoice| invoice.id == id }
  end  
end