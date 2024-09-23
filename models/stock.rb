class Stock < ApplicationRecord
    has_one :wallet, as: :walletable, dependent: :destroy
    validates :symbol, presence: true
  end
  