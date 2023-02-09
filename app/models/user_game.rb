class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :status, presence: true
  validates :borrower_id, presence:true, allow_nil: true

  # enum status: { lendable: 0, borrowed: 1 } # what attributes do we want?
end
