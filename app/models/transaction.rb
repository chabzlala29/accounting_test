class Transaction < ActiveRecord::Base
  has_many :postings
end
