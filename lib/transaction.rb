require_relative 'model_object'

class Transaction < ModelObject

  attr_reader :invoice_id,
              :credit_card_number,
              :cc_expiration_date,
              :result

  def initialize(data, item_repo)
    super
    @invoice_id         = data[:invoice_id].to_i
    @credit_card_number = data[:credit_card_number].to_i
    @cc_expiration_date = data[:cc_expiration_date]
    @result             = data[:result]
  end
  
end
