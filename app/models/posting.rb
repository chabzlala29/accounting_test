class Posting < ActiveRecord::Base
  belongs_to :account
  belongs_to :transact, foreign_key: :transaction_id
end
