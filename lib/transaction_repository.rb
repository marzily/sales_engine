require_relative 'repository'
require_relative 'transaction'

class TransactionRepository < Repository

  def model_class
    Transaction
  end

  def find_all_by_invoice_id(invoice_id)
    collection.select { |object| object.invoice_id == invoice_id }
  end

  def find_by_invoice_id(invoice_id)
    find_all_by_invoice_id(invoice_id).first
  end

  def find_all_by_credit_card_number(credit_card_number)
    collection.select { |object| object.credit_card_number == credit_card_number }
  end

  def find_by_credit_card_number(credit_card_number)
    find_all_by_credit_card_number(credit_card_number).first
  end

  def find_all_by_cc_expiration_date(cc_expiration_date)
    collection.select { |object| object.cc_expiration_date == cc_expiration_date }
  end

  def find_by_cc_expiration_date(cc_expiration_date)
    find_all_by_cc_expiration_date(cc_expiration_date).first
  end

  def find_all_by_result(result)
    collection.select { |object| object.result == result }
  end

  def find_by_result(result)
    find_all_by_result(result).first
  end

end
