require_relative 'repository'
require_relative 'transaction'

class TransactionRepository < Repository
  attr_reader :model_class, :all_by_invoice_id

  def initialize(data, engine)
    @model_class = Transaction
    super
  end

  def find_all_by_invoice_id(invoice_id)
    @all_by_invoice_id ||= hash_repo("invoice_id")
    @all_by_invoice_id[invoice_id]
  end

  def find_by_invoice_id(invoice_id)
    find_all_by_invoice_id(invoice_id).first
  end

  def find_all_by_credit_card_number(credit_card_number)
    @all_by_credit_card_number ||= hash_repo("credit_card_number")
    @all_by_credit_card_number[credit_card_number]
  end

  def find_by_credit_card_number(credit_card_number)
    find_all_by_credit_card_number(credit_card_number).first
  end

  def find_all_by_cc_expiration_date(cc_expiration_date)
    @all_by_cc_exp ||= hash_repo("cc_expiration_date")
    @all_by_cc_exp[cc_expiration_date]
  end

  def find_by_cc_expiration_date(cc_expiration_date)
    find_all_by_cc_expiration_date(cc_expiration_date).first
  end

  def find_all_by_result(result)
    @all_by_result ||= hash_repo("result")
    @all_by_result[result]
  end

  def find_by_result(result)
    find_all_by_result(result).first
  end
end
