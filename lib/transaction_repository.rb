require_relative 'transaction'

class TransactionRepository

  # :invoice_id,
  #             :credit_card_number,
  #             :cc_expiration_date,
  #             :result

  def find_all_by_name(name)
    collection.select { |object| object.name.downcase == name.downcase }
  end

  def find_by_name(name)
    find_all_by_name(name).first
  end

end
