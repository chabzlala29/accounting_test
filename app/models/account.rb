class Account < ActiveRecord::Base
  has_many :postings
end
