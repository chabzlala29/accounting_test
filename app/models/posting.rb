class Posting < ActiveRecord::Base
  belongs_to :account
  belongs_to :transact, foreign_key: :transaction_id, class_name: 'Transaction'

  enum status: [:withdrawal, :deposit]

  scope :active_transact, -> { joins(:transact).where(transactions: { status: Transaction.statuses['active'] }) }

  after_save :update_account_balance

  validates :amount, numericality: { greater_than: 0 }

  def converted_amount
    abs_amount = amount.try(:abs)
    if withdrawal?
      -(abs_amount)
    else
      abs_amount
    end
  end

  protected

  def update_account_balance
    if account
      bal = account.current_balance
      if bal >= amount
        account.update current_balance: (bal - amount)
      end
    end
  end
end
