class Wallet < ApplicationRecord
    belongs_to :walletable, polymorphic: true
    has_many :transactions
  
    def balance
      transactions.sum(:amount)
    end
  end
  