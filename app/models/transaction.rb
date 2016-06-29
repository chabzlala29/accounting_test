class Transaction < ActiveRecord::Base
  class SumOfPostingsValidator < ActiveModel::Validator
    def validate(record)
      if record.sum_of_postings != 0
        record.errors[:amount] << 'not a valid transaction with exceeding sum of postings.'
      end
    end
  end

  enum status: [:active, :inactive]

  has_many :postings, dependent: :destroy
  has_many :accounts, through: :postings

  accepts_nested_attributes_for :postings

  validates :comment, presence: true

  validates_with SumOfPostingsValidator, on: :update

  def sum_of_postings
    postings.map(&:converted_amount).sum
  end

  def withdrawal_amount
    postings.select{|p| p.withdrawal? }.map(&:amount).sum
  end

  def sufficient_balance?
    check_balance!
    balance_sufficient?
  end

  def check_balance!
    unless balance_sufficient?
      self.errors[:current_balance] << 'not enough funds'
    end
  end

  def balance_sufficient?
    account_balance > withdrawal_amount
  end

  def account_balance
    accounts.map(&:current_balance).sum
  end
end
