class Transaction < ApplicationRecord
  belongs_to :account

  validates :transaction_type, presence: true
  validates :value, presence: true
  validates :transaction_date, presence: true
  validates :account, presence: true
  
end
