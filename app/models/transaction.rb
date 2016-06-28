class Transaction < ActiveRecord::Base
  class SumOfPostingsValidator < ActiveModel::Validator
    def validate(record)
      if record.sum_of_postings != 0
        record.errors[:sum] << 'Not a valid transaction with exceeding sum of postings.'
      end
    end
  end

  has_many :postings, dependent: :destroy

  accepts_nested_attributes_for :postings

  validates :comment, presence: true

  validates_with SumOfPostingsValidator, on: :update

  def sum_of_postings
    postings.map(&:converted_amount).sum
  end
end
