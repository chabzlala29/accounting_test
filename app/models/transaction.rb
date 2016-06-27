class Transaction < ActiveRecord::Base
  has_many :postings

  accepts_nested_attributes_for :postings
end
