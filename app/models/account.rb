class Account < ActiveRecord::Base
  has_many :postings

  validates :name, presence: true, uniqueness: true
end
