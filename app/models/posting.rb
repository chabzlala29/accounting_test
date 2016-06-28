class Posting < ActiveRecord::Base
  belongs_to :account
  belongs_to :transact, foreign_key: :transaction_id

  enum status: [:withdrawal, :deposit]

  def converted_amount
    abs_amount = amount.try(:abs)
    if withdrawal?
      -(abs_amount)
    else
      abs_amount
    end
  end
end
