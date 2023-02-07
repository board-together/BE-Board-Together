class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :status, presence: true

  # enum status: { lendable: 0, borrowed: 1 } # what attributes do we want?
end
