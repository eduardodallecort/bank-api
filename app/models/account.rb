class Account < ApplicationRecord
    has_many :transactions, dependent: :destroy

    validates :name, presence: true
    validates :cpf, presence: true
    validates :rg, presence: true
    validates :dt_nasc, presence: true
    validates :password, presence: true
end
