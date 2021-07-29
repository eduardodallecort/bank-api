class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :transaction_type, :transaction_date, :previous_balance, :value, :new_balance
end
