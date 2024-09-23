class Transaction < ApplicationRecord
    belongs_to :wallet
    validates :amount, presence: true
    validate :valid_transaction
  
    private
  
    def valid_transaction
      errors.add(:base, 'Invalid transaction') if source_wallet.nil? && target_wallet.nil?
    end
  end
  