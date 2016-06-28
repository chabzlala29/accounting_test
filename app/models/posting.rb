class Posting < ActiveRecord::Base
  belongs_to :account
  belongs_to :transact, foreign_key: :transaction_id, class_name: 'Transaction'

  enum status: [:withdrawal, :deposit]

  scope :active_transact, -> { joins(:transact).where(transactions: { status: Transaction.statuses['active'] }) }

  def converted_amount
    abs_amount = amount.try(:abs)
    if withdrawal?
      -(abs_amount)
    else
      abs_amount
    end
  end
end
